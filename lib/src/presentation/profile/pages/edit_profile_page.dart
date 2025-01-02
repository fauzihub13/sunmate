import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/user_data/user_data_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User? user;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    context.read<UserDataBloc>().add(const UserDataEvent.getUserData());
    await _loadAuthData();
    nameController.text = user!.name!;
    phoneNumberController.text = user!.phoneNumber ?? '';
    emailController.text = user!.email!;
  }

  Future<void> _refreshPage() async {
    await _initializeData();
  }

  Future<void> _loadAuthData() async {
    final authData = await AuthLocalDatasources().getAuthData();
    setState(() {
      user = authData.user;
    });
  }

  Future<void> pickAndUploadImage(BuildContext context) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Uint8List bytes = await image.readAsBytes();

      if (bytes.isNotEmpty) {
        try {
          debugPrint('Gambar ada yang dipilih');
          if (context.mounted) {
            context
                .read<UserDataBloc>()
                .add(UserDataEvent.updateUserProfilePhoto(bytes: bytes));
          }
        } catch (e) {
          debugPrint('Gagal pilih gambar: ${e.toString()}');
        }
      }
    } else {
      debugPrint('Tidak ada gambar yang dipilih');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Data Akun', canBack: true),
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.lightBlue,
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white, width: 2),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: user?.avatar != null &&
                                  user!.avatar!.isNotEmpty
                              ? NetworkImage(user!.avatar)
                              : const AssetImage(
                                      'assets/images/avatar-place-holder.png')
                                  as ImageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocConsumer<UserDataBloc, UserDataState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          successUpdateUserProfilePhoto: (userData) {
                            AuthLocalDatasources().updateUserData(userData);
                            _refreshPage();
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Berhasil mengubah photo profile.',
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
                            if (message == 'logged_out') {
                              AuthLocalDatasources().removeAuthData();

                              // Schedule SnackBar display after current frame
                              SchedulerBinding.instance
                                  .addPostFrameCallback((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Silahkan login kembali.',
                                      style: TextStyle(color: Colors.white),
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

                                // Navigate to LoginPage after the SnackBar
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                  (route) => false,
                                );
                              });
                            } else if (context.mounted) {
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
                      builder: (context, state) {
                        return state.maybeWhen(orElse: () {
                          return GestureDetector(
                            onTap: () {
                              pickAndUploadImage(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                      width: 1, color: AppColors.darkBlue),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Text(
                                'Ubah Foto',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.darkBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        }, loading: () {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    width: 1, color: AppColors.darkBlue),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              'Memproses..',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.darkBlue,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Gambar harus dalam format JPEG, JPG, atau PNG dan kurang dari 2MB',
                        style:
                            TextStyle(color: AppColors.darkBlue, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    FormInput(
                      controller: nameController,
                      prefixIcon: const Icon(Icons.person_2_outlined),
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
                      controller: phoneNumberController,
                      prefixIcon: const Icon(Icons.call_outlined),
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
                      height: 48,
                    ),
                    BlocListener<UserDataBloc, UserDataState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          successUpdateUserData: (userData) {
                            AuthLocalDatasources().updateUserData(userData);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Berhasil mengubah data.',
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
                            if (message == 'logged_out') {
                              AuthLocalDatasources().removeAuthData();

                              // Schedule SnackBar display after current frame
                              SchedulerBinding.instance
                                  .addPostFrameCallback((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Silahkan login kembali.',
                                      style: TextStyle(color: Colors.white),
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

                                // Navigate to LoginPage after the SnackBar
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                  (route) => false,
                                );
                              });
                            } else if (context.mounted) {
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
                                        .add(UserDataEvent.updateUserData(
                                          name: nameController.text,
                                          phoneNumber:
                                              phoneNumberController.text,
                                          email: emailController.text,
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
