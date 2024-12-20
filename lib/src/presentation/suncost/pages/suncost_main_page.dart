import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/dropdown_menu.dart'
    as custom_dropdown_menu;
import 'package:flutter_sunmate/src/core/components/form_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/suncost/bloc/suncost_calculate/suncost_calculate_bloc.dart';
import 'package:flutter_sunmate/src/presentation/suncost/dialogs/suncost_result_dialog.dart';

class SuncostMainPage extends StatefulWidget {
  const SuncostMainPage({super.key});

  @override
  State<SuncostMainPage> createState() => _SunCostMainPageState();
}

class _SunCostMainPageState extends State<SuncostMainPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController roofTypeController = TextEditingController();
  final TextEditingController monthlyBillController = TextEditingController();
  final TextEditingController powerCapacityController = TextEditingController();
  final List<DropdownMenuItem<int>> powerLevelItems = [
    const DropdownMenuItem(value: 1300, child: Text('1300 W')),
    const DropdownMenuItem(value: 2200, child: Text('2200 W')),
    const DropdownMenuItem(value: 3500, child: Text('3500 W')),
    const DropdownMenuItem(value: 4400, child: Text('4400 W')),
    const DropdownMenuItem(value: 5500, child: Text('5500 W')),
    const DropdownMenuItem(value: 6600, child: Text('6600 W')),
    const DropdownMenuItem(value: 7700, child: Text('7700 W')),
    const DropdownMenuItem(value: 10600, child: Text('10.600 W')),
    const DropdownMenuItem(value: 11000, child: Text('11.000 W')),
    const DropdownMenuItem(value: 13200, child: Text('13.200 W')),
    const DropdownMenuItem(value: 13900, child: Text('13.900 W')),
    const DropdownMenuItem(value: 16500, child: Text('16.500 W')),
    const DropdownMenuItem(value: 17000, child: Text('17.000 W')),
    const DropdownMenuItem(value: 22000, child: Text('22.000 W')),
    const DropdownMenuItem(value: 23000, child: Text('23.000 W')),
    const DropdownMenuItem(value: 33000, child: Text('33.000 W')),
    const DropdownMenuItem(value: 41500, child: Text('41.500 W')),
  ];

  String selectedOption = 'rumah_tinggal';
  int powerLevelOption = 0;

  @override
  void dispose() {
    roofTypeController.dispose();
    monthlyBillController.dispose();
    powerCapacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'SunCost', canBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Penggunaan properti',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: _buildCustomButton(
                              label: 'Rumah tinggal',
                              isSelected: selectedOption == 'rumah_tinggal',
                              onTap: () {
                                setState(() {
                                  selectedOption = 'rumah_tinggal';
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildCustomButton(
                              label: 'Tempat usaha',
                              isSelected: selectedOption == 'tempat_usaha',
                              onTap: () {
                                setState(() {
                                  selectedOption = 'tempat_usaha';
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18.0),
                      FormInput(
                        textInputType: TextInputType.number,
                        prefixIcon: const Icon(
                          Icons.payments,
                        ),
                        labelText: 'Tagihan listrik bulanan',
                        controller: monthlyBillController,
                        style: FormStyle.filled,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tagihan tidak boleh kosong';
                          } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                            return 'Harus hanya mengandung angka';
                          } else if (int.parse(value) < 100000) {
                            return 'Tagihan harus lebih dari Rp100.000';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18.0),
                      custom_dropdown_menu.DropdownFormInput<int>(
                        value: null,
                        items: powerLevelItems,
                        labelText: 'Besar daya listrik',
                        hintText: 'Pilih besar daya listrik',
                        validator: (value) {
                          if (value == null || value <= 0) {
                            return 'Besar daya tidak boleh kosong';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            powerLevelOption = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<SuncostCalculateBloc, SuncostCalculateState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                loaded: (calculateModel) {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return SunCostResultDialog(
                          calculateModel: calculateModel,
                        );
                      });
                },
                error: (message) {
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
                });
          },
          child: BlocBuilder<SuncostCalculateBloc, SuncostCalculateState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return Button.filled(
                  label: 'Hitung',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SuncostCalculateBloc>().add(
                          SuncostCalculateEvent.calculate(
                              selectedOption,
                              int.parse(monthlyBillController.text),
                              powerLevelOption));
                    }
                  },
                );
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.lightBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.white : AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
