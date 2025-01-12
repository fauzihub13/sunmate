import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/models/response/message_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/group_chat_remote_datasources.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/widgets/alert_message.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/widgets/chat_card.dart';
import 'package:image_picker/image_picker.dart';

class SuntalkPage extends StatefulWidget {
  const SuntalkPage({super.key});

  @override
  State<SuntalkPage> createState() => _SunTalkPageState();
}

class _SunTalkPageState extends State<SuntalkPage> {
  final firestore = FirebaseFirestore.instance.collection('groups').get();

  final ScrollController _scrollController = ScrollController();

  late final TextEditingController chatController;
  User? user;

  // Instance Remote Datasource
  final GroupChatRemoteDatasources chatRemoteDatasource =
      GroupChatRemoteDatasources();

  bool hasScrolledToBottomInitially = false;

  @override
  void initState() {
    AuthLocalDatasources().getAuthData().then((value) {
      setState(() {
        user = value.user;
      });
    });
    chatController = TextEditingController();
    super.initState();
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
            await chatRemoteDatasource.sendMessage(imageUrl,
                userId: user!.id!, isImage: true);
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

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'SunTalk', canBack: true),
      body: Column(
        children: [
          StreamBuilder<List<MessageModel>>(
              stream: chatRemoteDatasource.allMessage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                      child: Center(child: CustomLoadingIndicator()));
                }
                final List<MessageModel> messages = snapshot.data ?? [];

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
                    final message = chatController.text.trim();
                    if (message.isNotEmpty) {
                      await chatRemoteDatasource.sendMessage(message,
                          userId: user!.id!);
                      chatController.clear();
                    }
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
