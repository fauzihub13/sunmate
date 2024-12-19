import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class SuntalkPage extends StatefulWidget {
  const SuntalkPage({super.key});

  @override
  State<SuntalkPage> createState() => _SunTalkPageState();
}

class _SunTalkPageState extends State<SuntalkPage> {
  late final TextEditingController chatController;

  @override
  void initState() {
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
    final TextEditingController chatController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppbar(title: 'SunTalk', canBack: true),
      body: Center(
        child: Text('Hai SunTalk'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          children: [
            const Icon(
              Icons.file_upload, color: AppColors.primary, // Warna ikon
              size: 35.0,
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FormInput(controller: chatController))),
            // FormInput(controller: chatController),
            const Icon(
              Icons.send, color: AppColors.primary, // Warna ikon
              size: 35.0,
            ),
          ],
        ),
      ),
    );
  }
}
