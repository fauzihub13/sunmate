import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/home/pages/home_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking/vendor_booking_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class VendorBookingStatusDialog extends StatefulWidget {
  const VendorBookingStatusDialog({super.key});

  @override
  State<VendorBookingStatusDialog> createState() => _VendorBookingStatusState();
}

class _VendorBookingStatusState extends State<VendorBookingStatusDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Wrap(spacing: 0, runSpacing: 0, children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset('assets/icons/success.svg'),
              ),
              const SizedBox(
                height: 6.0,
              ),
              const Center(
                child: Text(
                  'Berhasil membuat jadwal',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'KODE BOOKING',
                    style: TextStyle(color: AppColors.grey),
                  )),
              const SizedBox(
                height: 4,
              ),
              BlocBuilder<VendorBookingBloc, VendorBookingState>(
                builder: (context, state) {
                  final bookingCode = state.maybeWhen(
                      orElse: () => '-',
                      success: (vendor) => vendor.code);
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      bookingCode!,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(),
              const SizedBox(
                height: 8.0,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'VENDOR',
                    style: TextStyle(color: AppColors.grey),
                  )),
              const SizedBox(
                height: 4,
              ),
              BlocBuilder<VendorBookingBloc, VendorBookingState>(
                builder: (context, state) {
                  final vendorName = state.maybeWhen(
                      orElse: () => '-',
                      success: (vendor) => vendor.vendorName);
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      vendorName!,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(),
              const SizedBox(
                height: 8.0,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'TANGGAL BOOKING',
                    style: TextStyle(color: AppColors.grey),
                  )),
              const SizedBox(
                height: 4,
              ),
              BlocBuilder<VendorBookingBloc, VendorBookingState>(
                builder: (context, state) {
                  final bookingDate = state.maybeWhen(
                    orElse: () => '-',
                    success: (vendor) {
                      return DateFormat('dd MMMM yyyy')
                          .format(vendor.date!);
                    },
                  );
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      bookingDate,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(),
              const SizedBox(
                height: 20.0,
              ),
              Button.filled(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) =>
                          false, // Menghapus semua route sebelumnya
                    );
                  },
                  label: 'Kembali')
            ],
          ),
        ),
      ]),
    );
  }
}
