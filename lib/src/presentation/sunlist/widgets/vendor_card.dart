import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor/vendor_response_model.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_detail_page.dart';
import 'package:flutter_svg/svg.dart';

class VendorCard extends StatelessWidget {
  final SingleVendor data;

  const VendorCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailVendor(
            vendorId: data.id!,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 238, 238, 238)),
                borderRadius: BorderRadius.circular(20))),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                '${Variables.baseUrl}/storage/${data.vendorImages![0].path!}',
                width: 84,
                height: 84,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name!,
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
                      SvgPicture.asset(
                        'assets/icons/location.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Text(
                          data.address!,
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
            ),
          ],
        ),
      ),
    );
  }
}
