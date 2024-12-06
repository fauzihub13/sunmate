import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/components/vendor_card.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/vendor.dart';

class VendorBookingPage extends StatefulWidget {
  final Vendor vendor;
  const VendorBookingPage({super.key, required this.vendor});

  @override
  State<VendorBookingPage> createState() => _VendorBookingPageState();
}

class _VendorBookingPageState extends State<VendorBookingPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
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
              VendorCard(data: widget.vendor),
              const SizedBox(
                height: 18.0,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormInput(
                        textInputType: TextInputType.name,
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        labelText: 'Nama lengkap',
                        controller: nameController,
                        style: FormStyle.filled,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          } else if (!RegExp(r'^[a-zA-Z\s]+$')
                              .hasMatch(value)) {
                            return 'Nama hanya boleh mengandung huruf dan spasi';
                          } else if (value.length < 4) {
                            return 'Nama harus lebih dari 3 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      FormInput(
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        labelText: 'Email',
                        controller: emailController,
                        style: FormStyle.filled,
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
                      const SizedBox(height: 16.0),
                      FormInput(
                        textInputType: TextInputType.phone,
                        prefixIcon: const Icon(
                          Icons.call,
                        ),
                        labelText: 'No Hp',
                        controller: phoneController,
                        style: FormStyle.filled,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nomor HP tidak boleh kosong';
                          } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                            return 'Nomor HP harus berupa angka 10-15 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      FormInput(
                        textInputType: TextInputType.datetime,
                        prefixIcon: const Icon(
                          Icons.calendar_month,
                        ),
                        labelText: 'Tanggal',
                        controller: dateController,
                        style: FormStyle.filled,
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
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Button.filled(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Memproses Data'),
                      backgroundColor: AppColors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              label: 'Buat Jadwal')),
    );
  }
}
