import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking_history/vendor_booking_history_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/vendor_history_card.dart';

class VendorBookingHistory extends StatelessWidget {
  const VendorBookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return const MobileView();
      } else {
        return const MobileView();
      }
    });
  }
}

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  void initState() {
    super.initState();
    context
        .read<VendorBookingHistoryBloc>()
        .add(const VendorBookingHistoryEvent.getAllBookingHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Riwayat Booking', canBack: true),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            // CustomSearchBar(
            //   controller: searchController,
            //   onChanged: _onSearchChanged,
            // ),
            Expanded(
              child: BlocListener<VendorBookingHistoryBloc,
                  VendorBookingHistoryState>(
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      error: (message) {
                        if (message == 'logged_out') {
                          AuthLocalDatasources().removeAuthData();
                          // Schedule SnackBar display after current frame
                          SchedulerBinding.instance.addPostFrameCallback((_) {
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
                        }
                      });
                },
                child: BlocBuilder<VendorBookingHistoryBloc,
                    VendorBookingHistoryState>(builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Center(
                      child: Text('Terjadi kesalahan'),
                    ),
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loaded: (vendors) {
                      if (vendors.isEmpty) {
                        return const Center(
                          child: Text('Tidak ada riwayat'),
                        );
                      }
                      // return Container();
                      return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => VendorHistoryCard(
                          bookingHistoryDataResponse: vendors[index],
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 14.0),
                        itemCount: vendors.length,
                      );
                    },
                    error: (message) {
                      if (message == 'logged_out') {
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
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false,
                        );
                      }
                      return Center(child: Text('Error: $message'));
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
