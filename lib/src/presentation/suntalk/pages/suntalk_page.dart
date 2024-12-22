import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/chat_remote_datasources.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/widgets/alert_message.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/widgets/chat_card.dart';
import 'package:image_picker/image_picker.dart';

class SuntalkPage extends StatefulWidget {
  const SuntalkPage({super.key});

  @override
  State<SuntalkPage> createState() => _SunTalkPageState();
}

class _SunTalkPageState extends State<SuntalkPage> {
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref('chats');
  final ScrollController _scrollController = ScrollController();

  late final TextEditingController chatController;
  User? user;

  // Instance Remote Datasource
  final ChatRemoteDatasources remoteDatasource = ChatRemoteDatasources();

  @override
  void initState() {
    AuthLocalDatasources().getAuthData().then((value) {
      setState(() {
        user = value.user;
      });
    });
    chatController = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
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
          Expanded(
              child: FirebaseAnimatedList(
                  controller: _scrollController,
                  query: databaseReference,
                  itemBuilder: (context, snapshot, animation, index) {
                    String message = snapshot.child('message').value.toString();
                    bool isImage = snapshot.child('isImage').value == true;
                    int userId = int.tryParse(
                            snapshot.child('user_id').value.toString()) ??
                        0;
                    int timestamp = int.tryParse(
                            snapshot.child('timestamp').value.toString()) ??
                        0;

                    bool isSender = userId == user!.id!;

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToBottom();
                    });

                    return ChatCard(
                      message: message,
                      isImage: isImage,
                      userId: userId,
                      timestamp: timestamp,
                      isSender: isSender,
                    );
                  })),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final ImagePicker imagePicker = ImagePicker();
                    final XFile? image = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (image != null) {
                      Uint8List bytes = await image.readAsBytes();

                      if (bytes.isNotEmpty) {
                        try {
                          String? imageUrl =
                              await ChatRemoteDatasources().uploadImage(bytes);

                          if (imageUrl != null && imageUrl.isNotEmpty) {
                            await remoteDatasource.sendMessage(imageUrl,
                                userId: user!.id!, isImage: true);
                            _scrollToBottom();
                            if (context.mounted) {
                              showSunTalkSnackBar(context, "Gambar terkirim");
                            }
                          } else {
                            if (context.mounted) {
                              showSunTalkSnackBar(
                                  context, "Gagal mengirim gambar",
                                  backgroundColor: AppColors.darkRed);
                            }
                          }
                        } catch (e) {
                          if (context.mounted) {
                            showSunTalkSnackBar(
                                context, "Gagal mengirim gambar",
                                backgroundColor: AppColors.darkRed);
                          }
                        }
                      } else {
                        if (context.mounted) {
                          showSunTalkSnackBar(
                              context, "Gambar yang dipilih tidak sesuai",
                              backgroundColor: AppColors.darkRed);
                        }
                      }
                    } else {
                      debugPrint('Tidak ada gambar yang dipilih');
                    }
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
                      await remoteDatasource.sendMessage(message,
                          userId: user!.id!);
                      chatController.clear();
                      _scrollToBottom();
                      if (context.mounted) {
                        showSunTalkSnackBar(context, "Pesan terkirim");
                      }
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
