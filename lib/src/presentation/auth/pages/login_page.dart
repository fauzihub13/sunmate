import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/register_page.dart';
import 'package:flutter_sunmate/src/presentation/auth/widgets/circular_overlay.dart';
import 'package:flutter_sunmate/src/presentation/auth/widgets/rectangle_circular.dart';

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
        body: Stack(children: [
          const Positioned(
              top: -170,
              right: -170,
              child: CircularOverlay(
                size: 500,
                backgroundColor: Colors.transparent,
                borderColor: AppColors.overlayBlue,
              )),
          const Positioned(
              top: -250,
              right: -300,
              child: CircularOverlay(
                size: 500,
                backgroundColor: AppColors.lightBlue,
                borderColor: AppColors.lightBlue,
              )),
          const Positioned(
              bottom: -140,
              left: -150,
              child: RectangleCircular(
                size: 300,
                backgroundColor: Colors.transparent,
                borderColor: AppColors.overlayBlue,
              )),
          Positioned(
              bottom: -175,
              left: -130,
              child: Transform.rotate(
                angle: 0.50,
                child: const RectangleCircular(
                  size: 300,
                  backgroundColor: Colors.transparent,
                  borderColor: AppColors.overlayBlue,
                ),
              )),
          Padding(
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
                Form(
                    child: Column(
                  children: [
                    FormInput(
                      controller: emailController,
                      prefixIcon: const Icon(Icons.mail_outline),
                      hintText: 'Email',
                      labelText: 'Email',
                      style: FormStyle.outlined,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormInput(
                      controller: passwordController,
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: 'Kata sandi',
                      labelText: 'Kata sandi',
                      style: FormStyle.outlined,
                    ),
                  ],
                )),
                const SizedBox(
                  height: 70,
                ),
                Button.filled(
                  label: 'Masuk',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 12,
                ),
                Button.outlined(
                  label: 'Daftar',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const RegisterPage();
                    }));
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
