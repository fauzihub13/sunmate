import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/components/vendor_card.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/vendor.dart';

class VendorBookingPage extends StatelessWidget {
  final Vendor vendor;
  const VendorBookingPage({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController provinceController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController districtController = TextEditingController();
    final TextEditingController subdistrictController = TextEditingController();
    final TextEditingController addressDetailController =
        TextEditingController();
    final TextEditingController notesController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppbar(title: 'Buat Jadwal', canBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              VendorCard(data: vendor),
              const SizedBox(
                height: 18.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nama Lengkap',
                  style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              FormInput(
                controller: nameController,
                style: FormStyle.filled,
              ),
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              FormInput(
                controller: emailController,
                style: FormStyle.filled,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nomor Hp',
                              style: TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          FormInput(
                            controller: phoneController,
                            style: FormStyle.filled,
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 14.0,
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Tanggal',
                              style: TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          FormInput(
                            controller: dateController,
                            style: FormStyle.filled,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Provinsi',
                              style: TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          FormInput(
                            controller: provinceController,
                            style: FormStyle.filled,
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 14.0,
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Kota',
                              style: TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          FormInput(
                            controller: cityController,
                            style: FormStyle.filled,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Kecamatan',
                              style: TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          FormInput(
                            controller: districtController,
                            style: FormStyle.filled,
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 14.0,
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Kelurahan',
                              style: TextStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          FormInput(
                            controller: subdistrictController,
                            style: FormStyle.filled,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Detail Alamat',
                  style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              FormInput(
                controller: addressDetailController,
                style: FormStyle.filled,
              ),
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Catatan',
                  style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              FormInput(
                controller: notesController,
                style: FormStyle.filled,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Button.filled(
              onPressed: () {
                print('hai');
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return VendorBookingPage(
                //     vendor: vendor,
                //   );
                // }
                // ));
              },
              label: 'Buat Jadwal')),
    );
  }
}
