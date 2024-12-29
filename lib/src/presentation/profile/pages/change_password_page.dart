import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/user_data/user_data_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Ubah Kata Sandi', canBack: true),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                FormInput(
                  controller: oldPasswordController,
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'Kata sandi lama',
                  labelText: 'Kata sandi lama',
                  style: FormStyle.outlined,
                  obscureText: !_isOldPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isOldPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isOldPasswordVisible = !_isOldPasswordVisible;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata sandi tidak boleh kosong';
                    } else if (value.length < 9) {
                      return 'Kata sandi harus lebih dari 8 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                FormInput(
                  controller: newPasswordController,
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'Kata sandi baru',
                  labelText: 'Kata sandi baru',
                  style: FormStyle.outlined,
                  obscureText: !_isNewPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isNewPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isNewPasswordVisible = !_isNewPasswordVisible;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata sandi tidak boleh kosong';
                    } else if (value.length < 9) {
                      return 'Kata sandi harus lebih dari 8 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                FormInput(
                  controller: confirmPasswordController,
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'Ulangi kata sandi baru',
                  labelText: 'Ulangi kata sandi baru',
                  style: FormStyle.outlined,
                  obscureText: !_isConfirmPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata sandi tidak boleh kosong';
                    } else if (value.length < 9) {
                      return 'Kata sandi harus lebih dari 8 karakter';
                    } else if (value != newPasswordController.text) {
                      return 'Konfirmasi kata sandi tidak cocok';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 48,
                ),
                BlocListener<UserDataBloc, UserDataState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      successUpdateUserPassword: () {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Berhasil mengubah password.',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: AppColors.green,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        }
                      },
                      error: (message) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                message,
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: AppColors.red,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        }
                      },
                    );
                  },
                  child: BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Button.filled(
                            label: 'Simpan',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<UserDataBloc>()
                                    .add(UserDataEvent.updateUserPassword(
                                      oldPassword: oldPasswordController.text,
                                      password: newPasswordController.text,
                                      passwordConfirmation:
                                          confirmPasswordController.text,
                                    ));
                              }
                            },
                          );
                        },
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
