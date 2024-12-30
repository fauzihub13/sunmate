import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor_response_model.dart';
import 'package:flutter_svg/svg.dart';

class VendorSearchCard extends StatelessWidget {
  final SingleVendor vendor;
  

  const VendorSearchCard({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border:
            const Border(bottom: BorderSide(color: AppColors.grey, width: 0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/location.svg',
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vendor.name!,
                  maxLines: 1,
                  style: const TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        vendor.address!,
                        maxLines: 1,
                        style: const TextStyle(
                          color: AppColors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
