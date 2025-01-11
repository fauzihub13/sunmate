import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class PrivateChatPage extends StatefulWidget {
  const PrivateChatPage({super.key});

  @override
  State<PrivateChatPage> createState() => _PrivateChatPageState();
}

class _PrivateChatPageState extends State<PrivateChatPage> {
  late final TextEditingController chatController;

  @override
  void initState() {
    super.initState();
    chatController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Private Chat', canBack: true),
      body: Column(
        children: [
          const Expanded(
              child: Center(child: Text('Private chat with vendor'))),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    // pickAndUploadImage(context);
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
                      // await chatRemoteDatasource.sendMessage(message,
                      //     userId: user!.id!);
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
