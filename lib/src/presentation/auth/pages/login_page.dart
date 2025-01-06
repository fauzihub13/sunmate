import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_snackbar.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/firebase_notification_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/google_auth/google_auth_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/register_page.dart';
import 'package:flutter_sunmate/src/presentation/auth/widgets/circular_overlay.dart';
import 'package:flutter_sunmate/src/presentation/auth/widgets/rectangle_circular.dart';
import 'package:flutter_sunmate/src/presentation/home/pages/landing_page.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Stack(children: [
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16, top: 44, bottom: 32),
              child: SingleChildScrollView(
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
                        key: _formKey,
                        child: Column(
                          children: [
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
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
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
                              obscureText:
                                  !_isPasswordVisible, // Password akan disembunyikan
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 70,
                    ),
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        state.maybeWhen(
                            orElse: () {},
                            success: (authReponseModel) {
                              AuthLocalDatasources()
                                  .saveAuthData(authReponseModel);
                              FirebaseNotificationDatasources()
                                  .initNotifications();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LandingPage();
                              }));
                            },
                            error: (message) {
                              CustomSnackbar.show(context,
                                  message: message, status: 'fail');
                            });
                      },
                      child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                        return state.maybeWhen(orElse: () {
                          return Button.filled(
                            label: 'Masuk',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(LoginEvent.login(
                                    email: emailController.text,
                                    password: passwordController.text));
                              }
                            },
                          );
                        }, loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.grey,
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'atau',
                              style: TextStyle(color: AppColors.grey),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.grey,
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocConsumer<GoogleAuthBloc, GoogleAuthState>(
                      listener: (context, state) {
                        state.maybeWhen(
                            orElse: () {},
                            success: (authReponseModel) {
                              AuthLocalDatasources()
                                  .saveAuthData(authReponseModel);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LandingPage();
                              }));
                            },
                            error: (message) {
                              CustomSnackbar.show(context,
                                  message: message, status: 'fail');
                            });
                      },
                      builder: (context, state) {
                        return state.maybeWhen(orElse: () {
                          return Button.outlined(
                            icon: SizedBox(
                              child: SvgPicture.asset(
                                'assets/icons/google.svg',
                                width: 22,
                                height: 22,
                              ),
                            ),
                            label: 'Masuk dengan Google',
                            onPressed: () {
                              context
                                  .read<GoogleAuthBloc>()
                                  .add(const GoogleAuthEvent.signIn());
                            },
                          );
                        }, loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Belum punya akun?',
                          style: TextStyle(color: AppColors.grey),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.white,
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const RegisterPage();
                              }));
                            },
                            child: const Text(
                              'Daftar',
                              style: TextStyle(color: AppColors.darkBlue),
                            ))
                      ],
                    )
                    // Button.outlined(
                    //   label: 'Daftar',
                    //   onPressed: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) {
                    //       return const RegisterPage();
                    //     }));
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
