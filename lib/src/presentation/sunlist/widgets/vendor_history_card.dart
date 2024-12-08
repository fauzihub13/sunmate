import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor_booking_model.dart';
import 'package:intl/intl.dart';

class VendorHistoryCard extends StatelessWidget {
  final VendorBookingModel vendorBookingModel;
  const VendorHistoryCard({super.key, required this.vendorBookingModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Wrap(spacing: 0, runSpacing: 0, children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Text(
                    vendorBookingModel.codeBooking,
                    style: const TextStyle(
                        color: AppColors.lightBlue,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            vendorBookingModel.vendorImage,
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
                          vendorBookingModel.vendorName,
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
                            const Icon(
                              Icons.calendar_month,
                              color: AppColors.grey,
                              size: 18.0,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              DateFormat('dd MMMM yyyy')
                                  .format(vendorBookingModel.bookingDate),
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.lightYellow,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Text(
                            vendorBookingModel.status == 'pending'
                                ? 'Menunggu konfirmasi'
                                : '',
                            style: const TextStyle(
                              color: AppColors.darkYellow,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
