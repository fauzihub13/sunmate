import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/user_data/user_data_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/profile/pages/change_password_page.dart';
import 'package:flutter_sunmate/src/presentation/profile/pages/edit_profile_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_booking_history.dart';

class AccountProfilePage extends StatefulWidget {
  const AccountProfilePage({super.key});

  @override
  State<AccountProfilePage> createState() => _AccountProfilePageState();
}

class _AccountProfilePageState extends State<AccountProfilePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    context.read<UserDataBloc>().add(const UserDataEvent.getUserData());
    await _loadAuthData();
  }

  Future<void> _refresh() async {
    await _initializeData();
  }

  Future<void> _loadAuthData() async {
    final authData = await AuthLocalDatasources().getAuthData();
    setState(() {
      user = authData.user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: const CustomAppbar(
        title: 'Profil',
        canBack: false,
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.lightBlue,
        onRefresh: _refresh,
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: AppColors.white,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 120),
                          const Text(
                            'AKUN PENGGUNA',
                            style: TextStyle(
                                color: AppColors.darkBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const EditProfilePage();
                                      }));
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.person_2_outlined,
                                          color: AppColors.darkBlue,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Data Akun',
                                          style: TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (user?.googleId == null)
                                    Column(
                                      children: [
                                        const SizedBox(
                                            height: 10), // Elemen pertama

                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const ChangePasswordPage();
                                            }));
                                          },
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.lock_outline,
                                                color: AppColors.darkBlue,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                'Ubah Kata Sandi',
                                                style: TextStyle(
                                                  color: AppColors.darkBlue,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ), // Elemen kedua

                                        // Elemen ketiga
                                      ],
                                    ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const VendorBookingHistory();
                                      }));
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.history,
                                          color: AppColors.darkBlue,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Riwayat Booking Vendor',
                                          style: TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'PENGATURAN',
                            style: TextStyle(
                                color: AppColors.darkBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  BlocListener<LogoutBloc, LogoutState>(
                                    listener: (context, state) {
                                      state.maybeWhen(
                                          orElse: () {},
                                          success: () {
                                            AuthLocalDatasources()
                                                .removeAuthData();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const Text(
                                                  'Berhasil logout',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor:
                                                    AppColors.green,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 10),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                duration:
                                                    const Duration(seconds: 3),
                                              ),
                                            );
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginPage()),
                                              (route) => false,
                                            );
                                          },
                                          error: (message) {
                                            if (message == 'logged_out') {
                                              AuthLocalDatasources()
                                                  .removeAuthData();

                                              // Schedule SnackBar display after current frame
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: const Text(
                                                      'Silahkan login kembali.',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    backgroundColor:
                                                        AppColors.red,
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16,
                                                        vertical: 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    duration: const Duration(
                                                        seconds: 3),
                                                  ),
                                                );

                                                // Navigate to LoginPage after the SnackBar
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginPage()),
                                                  (route) => false,
                                                );
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    message,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor:
                                                      AppColors.red,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 10),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  duration: const Duration(
                                                      seconds: 3),
                                                ),
                                              );
                                            }
                                          });
                                    },
                                    child: GestureDetector(
                                      onTap: () async {
                                        final authData =
                                            await AuthLocalDatasources()
                                                .getAuthData();
                                        if (context.mounted) {
                                          context.read<LogoutBloc>().add(
                                              LogoutEvent.logout(
                                                  token: authData.token!));
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Transform(
                                            alignment: Alignment.center,
                                            transform:
                                                Matrix4.rotationY(3.1416),
                                            child: const Icon(
                                              Icons.logout_outlined,
                                              color: AppColors.darkBlue,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Keluar',
                                            style: TextStyle(
                                              color: AppColors.darkBlue,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white, width: 2),
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/avatar.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<UserDataBloc, UserDataState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              user?.name ?? 'Loading...',
                              style: const TextStyle(
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          );
                        },
                        successGetUserData: (userData) {
                          AuthLocalDatasources().updateUserData(userData);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              userData.name!,
                              style: const TextStyle(
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
