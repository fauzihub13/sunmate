import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/suncost/models/calculate_model.dart';
import 'package:flutter_svg/svg.dart';

class SunCostResultDialog extends StatefulWidget {
  final CalculateModel calculateModel;
  const SunCostResultDialog({super.key, required this.calculateModel});

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
                height: 24.0,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Peruntukan Lokasi',
                    style: TextStyle(color: AppColors.grey),
                  )),
              const SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.calculateModel.placePurpose == 'rumah_tinggal'
                      ? 'Rumah Tinggal'
                      : 'Tempat Usaha',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
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
                    'Tagihan listrik bulanan',
                    style: TextStyle(color: AppColors.grey),
                  )),
              const SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rp. ${widget.calculateModel.monthlyBill.toString()}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
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
                    'Besar daya listrik',
                    style: TextStyle(color: AppColors.grey),
                  )),
              const SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${widget.calculateModel.powerLevel.toString()} W',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Divider(),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'Estimasi biaya untuk memasang panel surya adalah\nRp. ${widget.calculateModel.costEstimate}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: AppColors.darkBlue),
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
