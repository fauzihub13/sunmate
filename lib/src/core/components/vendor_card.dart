import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/vendor.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_detail_page.dart';
import 'package:flutter_svg/svg.dart';

class VendorCard extends StatelessWidget {
  final Vendor data;

  const VendorCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailVendor(
            vendor: data,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 238, 238, 238)),
                borderRadius: BorderRadius.circular(20))),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    data.imageUrls[0],
                    width: 84,
                    height: 84,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  maxLines: 2,
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
                    SvgPicture.asset(
                      'assets/icons/location.svg',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      data.location,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/star.svg',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      data.rating.toString(),
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
