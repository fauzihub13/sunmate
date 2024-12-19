import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/chat_remote_datasources.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/widgets/chat_card.dart';

class SuntalkPage extends StatefulWidget {
  const SuntalkPage({super.key});

  @override
  State<SuntalkPage> createState() => _SunTalkPageState();
}

class _SunTalkPageState extends State<SuntalkPage> {
  late final TextEditingController chatController;
  User? user;

  List<Map<String, dynamic>> dummyMessages = [
    {
      'message': 'Pesan pertama',
      'isImage': false,
      'userId': 11,
      'timestamp': DateTime.now()
              .subtract(Duration(minutes: 1))
              .millisecondsSinceEpoch ~/
          1000,
    },
    {
      'message': 'Pesan kedua dengan gambar',
      'isImage': true,
      'userId': 11,
      'timestamp': DateTime.now()
              .subtract(Duration(minutes: 2))
              .millisecondsSinceEpoch ~/
          1000,
    },
    {
      'message': 'Pesan ketiga',
      'isImage': false,
      'userId': 3,
      'timestamp': DateTime.now()
              .subtract(Duration(minutes: 3))
              .millisecondsSinceEpoch ~/
          1000,
    },
  ];

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
            child: ListView.builder(
              itemCount: dummyMessages.length,
              itemBuilder: (context, index) {
                var messageData = dummyMessages[index];
                if (messageData['userId'] == 3) {
                  return ChatCard(
                    message: messageData['message'],
                    isImage: messageData['isImage'],
                    userId: messageData['userId'],
                    timestamp: messageData['timestamp'],
                    isSender: true,
                  );
                } else {
                  return ChatCard(
                    message: messageData['message'],
                    isImage: messageData['isImage'],
                    userId: messageData['userId'],
                    timestamp: messageData['timestamp'],
                    isSender: false,
                  );
                }
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          children: [
            const Icon(
              Icons.file_upload,
              color: AppColors.primary,
              size: 35.0,
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pesan terkirim'),
                      backgroundColor: AppColors.primary,
                      duration: Duration(seconds: 2),
                    ),
                  );
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
    );
  }
}
