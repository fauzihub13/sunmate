import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/models/response/channel_message_model.dart';
import 'package:flutter_sunmate/src/data/models/response/private_message_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/group_chat_remote_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/private_message_datasources.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/widgets/alert_message.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/widgets/chat_card.dart';
import 'package:image_picker/image_picker.dart';

class PrivateChatPage extends StatefulWidget {
  final User partnerUser;
  const PrivateChatPage({super.key, required this.partnerUser});

  @override
  State<PrivateChatPage> createState() => _PrivateChatPageState();
}

class _PrivateChatPageState extends State<PrivateChatPage> {
  late final TextEditingController chatController;
  final ScrollController _scrollController = ScrollController();

  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    chatController = TextEditingController();
    _loadUser();
  }

  void _loadUser() async {
    final authData = await AuthLocalDatasources().getAuthData();
    setState(() {
      user = authData.user;
      isLoading = false;
    });
  }

  Future<void> pickAndUploadImage(BuildContext context) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Uint8List bytes = await image.readAsBytes();

      if (bytes.isNotEmpty) {
        try {
          String? imageUrl =
              await GroupChatRemoteDatasources().uploadImage(bytes);

          if (imageUrl != null && imageUrl.isNotEmpty) {
            sendMessage(textMessage: imageUrl, isImage: true);
            // _scrollToBottom();
            if (context.mounted) {
              showSunTalkSnackBar(context, "Gambar terkirim");
            }
          } else {
            if (context.mounted) {
              showSunTalkSnackBar(context, "Gagal mengirim gambar",
                  backgroundColor: AppColors.darkRed);
            }
          }
        } catch (e) {
          if (context.mounted) {
            showSunTalkSnackBar(context, "Gagal mengirim gambar",
                backgroundColor: AppColors.darkRed);
          }
        }
      } else {
        if (context.mounted) {
          showSunTalkSnackBar(context, "Gambar yang dipilih tidak sesuai",
              backgroundColor: AppColors.darkRed);
        }
      }
    } else {
      debugPrint('Tidak ada gambar yang dipilih');
    }
  }

  void sendMessage({required String textMessage, bool isImage = false}) async {
    if (textMessage.isNotEmpty) {
      final channel = ChannelMessageModel(
          id: channelId(
              user!.id!.toString(), widget.partnerUser.id!.toString()),
          memberIds: [user!.id!.toString(), widget.partnerUser.id!.toString()],
          lastMessage: textMessage,
          lastTime: Timestamp.now(),
          unRead: {
            user!.id!.toString(): false,
            widget.partnerUser.id!.toString(): true,
          },
          sendBy: user!.id!.toString());

      await PrivateMessageDatasources.instance
          .updateChannel(channel.id, channel.toMap());

      var docRef = FirebaseFirestore.instance.collection('messages').doc();
      var message = PrivateMessageModel(
        id: docRef.id,
        isImage: isImage,
        message: textMessage,
        timestamp: Timestamp.now(),
        userId: user!.id!,
        channelId: channel.id,
      );

      PrivateMessageDatasources.instance.addMessage(message);
      chatController.clear();

      var channelUpdateData = {
        'lastMessage': textMessage,
        'sendBy': user!.id!.toString(),
        'lastTime': message.timestamp,
        'unRead': {
          user!.id!.toString(): false,
          widget.partnerUser.id!.toString(): true,
        }
      };

      await PrivateMessageDatasources.instance
          .updateChannel(channel.id, channelUpdateData);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CustomLoadingIndicator();
    } else {
      return Scaffold(
        appBar: CustomAppbar(title: widget.partnerUser.name!, canBack: true),
        body: Column(
          children: [
            StreamBuilder<List<PrivateMessageModel>>(
                stream: PrivateMessageDatasources.instance.messageStream(
                    channelId(widget.partnerUser.id!.toString(),
                        user!.id!.toString())),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                        child: Center(child: CustomLoadingIndicator()));
                  }
                  final List<PrivateMessageModel> messages =
                      snapshot.data ?? [];

                  if (messages.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text('No message found'),
                      ),
                    );
                  }
                  return Expanded(
                      child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      bool isImage = message.isImage == true;
                      int userId = message.userId;

                      bool isSender = userId == user!.id!;

                      return ChatCard(
                        message: message.message,
                        isImage: isImage,
                        userId: userId,
                        timestamp: message.timestamp,
                        isSender: isSender,
                      );
                    },
                  ));
                }),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      pickAndUploadImage(context);
                    },
                    child: const Icon(
                      Icons.file_upload,
                      color: AppColors.primary,
                      size: 35.0,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: FormInput(
                        controller: chatController,
                        hintText: 'Ketik pesan di sini...',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final textMessage = chatController.text.trim();
                      sendMessage(textMessage: textMessage);
                    },
                    child: const Icon(
                      Icons.send,
                      color: AppColors.primary,
                      size: 35.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
