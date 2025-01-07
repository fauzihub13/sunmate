import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/custom_snackbar.dart';
import 'package:flutter_sunmate/src/core/components/date_picker.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking/vendor_booking_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_detail/vendor_detail_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/dialogs/vendor_booking_status_dialog.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor_booking_model.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/vendor_card.dart';

class VendorBookingPage extends StatefulWidget {
  final SingleVendor vendor;
  const VendorBookingPage({super.key, required this.vendor});

  @override
  State<VendorBookingPage> createState() => _VendorBookingPageState();
}

class _VendorBookingPageState extends State<VendorBookingPage> {
  final _formKey = GlobalKey<FormState>();
  User? user;

  late final TextEditingController dateController;
  late final TextEditingController addressDetailController;
  late final TextEditingController notesController;

  @override
  void initState() {
    AuthLocalDatasources().getAuthData().then((value) {
      setState(() {
        user = value.user;
      });
    });
    super.initState();

    dateController = TextEditingController();
    addressDetailController = TextEditingController();
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    dateController.dispose();
    addressDetailController.dispose();
    notesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
    final TextEditingController addressDetailController =
        TextEditingController();
    final TextEditingController notesController = TextEditingController();

    return BlocBuilder<VendorDetailBloc, VendorDetailState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(child: Text('Vendor tidak ditemukan')),
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (dataVendor) {
            return Scaffold(
              appBar: const CustomAppbar(title: 'Buat Jadwal', canBack: true),
              body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        VendorCard(data: dataVendor),
                        const SizedBox(
                          height: 18.0,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                FormInput(
                                  textInputType: TextInputType.datetime,
                                  prefixIcon: const Icon(
                                    Icons.calendar_month,
                                  ),
                                  labelText: 'Tanggal',
                                  controller: dateController,
                                  style: FormStyle.filled,
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Tanggal harus diisi';
                                    }
                                    return null;
                                  },
                                  onTap: () async {
                                    await DatePickerHandler
                                        .showDatePickerDialog(
                                            context, dateController);
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                FormInput(
                                  textInputType: TextInputType.multiline,
                                  prefixIcon: const Icon(
                                    Icons.home_filled,
                                  ),
                                  maxLines: 2,
                                  labelText: 'Alamat rumah',
                                  controller: addressDetailController,
                                  style: FormStyle.filled,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Alamat tidak boleh kosong';
                                    } else if (value.length < 10) {
                                      return 'Alamat harus lebih dari 10 karakter';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                FormInput(
                                  textInputType: TextInputType.multiline,
                                  prefixIcon: const Icon(
                                    Icons.description,
                                  ),
                                  labelText: 'Catatan',
                                  maxLines: 3,
                                  controller: notesController,
                                  style: FormStyle.filled,
                                  validator: (value) {
                                    if (value != null && value.length > 200) {
                                      return 'Catatan tidak boleh lebih dari 200 karakter';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )),
                      ],
                    )),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: BlocListener<VendorBookingBloc, VendorBookingState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      success: (bookingDataResponse) {
                        dateController.clear();
                        addressDetailController.clear();
                        notesController.clear();
                        _formKey.currentState!.reset();
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return const VendorBookingStatusDialog();
                            });
                      },
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
                        } else {
                          CustomSnackbar.show(context,
                              message: message, status: 'fail');
                        }
                      },
                    );
                  },
                  child: BlocBuilder<VendorBookingBloc, VendorBookingState>(
                    builder: (context, state) {
                      return state.maybeWhen(orElse: () {
                        // Show the button if not loading
                        return Button.filled(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final VendorBookingModel vendorBooking =
                                  VendorBookingModel(
                                userId: user!.id!,
                                vendorId: dataVendor.id!.toString(),
                                address: addressDetailController.text,
                                date: DateTime.parse(dateController.text),
                                notes: notesController.text,
                              );
                              context.read<VendorBookingBloc>().add(
                                  VendorBookingEvent.createBooking(
                                      vendorBooking));
                            }
                          },
                          label: 'Buat Jadwal',
                        );
                      }, loading: () {
                        return Button.filled(
                          onPressed: () {},
                          label: 'Memproses...',
                        );
                      });
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
