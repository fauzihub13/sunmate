import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/core/components/custom_snackbar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/sources/auth/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/notification/bloc/notification/notification_bloc.dart';
import 'package:flutter_sunmate/src/presentation/notification/widgets/card_notification.dart';

class NotificationListPage extends StatefulWidget {
  const NotificationListPage({super.key});

  @override
  State<NotificationListPage> createState() => _NotificationListPageState();
}

class _NotificationListPageState extends State<NotificationListPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getAllNotification());
  }

  Future<void> _refreshPage() async {
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getAllNotification());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Notifikasi', canBack: true),
      body: RefreshIndicator(
        color: AppColors.darkBlue,
        backgroundColor: AppColors.white,
        onRefresh: _refreshPage,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Expanded(
                  child: BlocConsumer<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const Center(
                        child: Text('Fetching notifications...'));
                  },
                  loading: () {
                    return const Center(child: CustomLoadingIndicator());
                  },
                  loaded: (notifications) {
                    if (notifications.isEmpty) {
                      return const Center(
                        child: Text('Tidak ada riwayat'),
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: CardNotification(
                              notification: notifications[index]),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 14.0),
                      itemCount: notifications.length,
                    );
                  },
                );
              }, listener: (context, state) {
                state.maybeWhen(
                    orElse: () {},
                    error: (message) {
                      if (message == 'logged_out') {
                        AuthLocalDatasources().removeAuthData();

                        // Schedule SnackBar display after current frame
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          CustomSnackbar.show(context,
                              message: 'Silahkan login kembali.',
                              status: 'fail');

                          // Navigate to LoginPage after the SnackBar
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false,
                          );
                        });
                      }
                    });
              })),
            ],
          ),
        ),
      ),
    );
  }
}
