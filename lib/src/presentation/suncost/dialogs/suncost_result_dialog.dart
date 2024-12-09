import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class SunCostResultDialog extends StatefulWidget {
  const SunCostResultDialog({super.key});

  @override
  State<SunCostResultDialog> createState() => _SunCostResultDialogState();
}

class _SunCostResultDialogState extends State<SunCostResultDialog> {
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
                  'Berhasil menghitung estimasi',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'Total estimasi biaya Anda adalah Rp12.000.000',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColors.darkBlue),
              ),
              const SizedBox(
                height: 36.0,
              ),
              Button.filled(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: 'Tutup')
            ],
          ),
        ),
      ]),
    );
  }
}
