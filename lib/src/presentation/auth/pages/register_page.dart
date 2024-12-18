import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/auth/widgets/circular_overlay.dart';
import 'package:flutter_sunmate/src/presentation/auth/widgets/rectangle_circular.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  'Daftar',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const Text(
                  'Hai, silahkan buat akun baru!!',
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
                      hintText: 'Nama lengkap',
                      labelText: 'Nama lengkap',
                      style: FormStyle.outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                          return 'Nama hanya boleh mengandung huruf dan spasi';
                        } else if (value.length < 4) {
                          return 'Nama harus lebih dari 3 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormInput(
                      controller: emailController,
                      prefixIcon: const Icon(Icons.mail_outline),
                      hintText: 'No Hp',
                      labelText: 'No Hp',
                      style: FormStyle.outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor HP tidak boleh kosong';
                        } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                          return 'Nomor HP harus berupa angka 10-15 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormInput(
                      controller: emailController,
                      prefixIcon: const Icon(Icons.mail_outline),
                      hintText: 'Email',
                      labelText: 'Email',
                      style: FormStyle.outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Format email tidak valid';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kata sandi tidak boleh kosong';
                        } else if (value.length < 9) {
                          return 'Nama harus lebih dari 8 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormInput(
                      controller: passwordController,
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: 'Ulangi kata sandi',
                      labelText: 'Ulangi kata sandi',
                      style: FormStyle.outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Konfirmasi kata sandi tidak boleh kosong';
                        } else if (value != passwordController.text) {
                          return 'Konfirmasi kata sandi tidak cocok';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
                const SizedBox(
                  height: 70,
                ),
                Button.filled(
                  label: 'Daftar',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Button.outlined(
                  label: 'Masuk',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginPage();
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
