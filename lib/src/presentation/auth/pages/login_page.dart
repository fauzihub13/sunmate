import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Masuk',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const Text(
                'Hai, selamat datang kembali!',
                style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 50,
              ),
              FormInput(
                controller: emailController,
                prefixIcon: const Icon(Icons.mail_outline),
                hintText: 'Email',
                labelText: 'Email',
              ),
              const SizedBox(
                height: 16,
              ),
              FormInput(
                controller: passwordController,
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: 'Kata sandi',
                labelText: 'Kata sandi',
              ),
              const SizedBox(
                height: 70,
              ),
              Button.filled(
                onPressed: () {},
                label: 'Masuk',
              ),
              const SizedBox(
                height: 12,
              ),
              Button.outlined(
                onPressed: () {},
                label: 'Daftar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
