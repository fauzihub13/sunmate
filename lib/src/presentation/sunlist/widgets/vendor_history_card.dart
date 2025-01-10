import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor/vendor_booking_history_model.dart';
import 'package:intl/intl.dart';

class VendorHistoryCard extends StatelessWidget {
  final BookingHistoryDataResponse bookingHistoryDataResponse;
  const VendorHistoryCard(
      {super.key, required this.bookingHistoryDataResponse});

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 0, runSpacing: 0, children: [
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
                  bookingHistoryDataResponse.code!,
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      '${Variables.baseUrl}/storage/${bookingHistoryDataResponse.vendorImage}',
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
                          bookingHistoryDataResponse.vendorName!,
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
                            const Icon(
                              Icons.calendar_month,
                              color: AppColors.grey,
                              size: 18.0,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              DateFormat('dd MMMM yyyy')
                                  .format(bookingHistoryDataResponse.date!),
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
                            color: bookingHistoryDataResponse.status ==
                                    'pending'
                                ? AppColors.lightYellow
                                : bookingHistoryDataResponse.status ==
                                        'confirmed'
                                    ? AppColors.lightBlue
                                    : bookingHistoryDataResponse.status ==
                                            'in_progress'
                                        ? AppColors.lightBlue
                                        : bookingHistoryDataResponse.status ==
                                                'canceled'
                                            ? AppColors.lightRed
                                            : bookingHistoryDataResponse
                                                        .status ==
                                                    'completed'
                                                ? AppColors.lightGreen
                                                : AppColors
                                                    .grey, // Default background color
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Text(
                            bookingHistoryDataResponse.status == 'pending'
                                ? 'Menunggu konfirmasi'
                                : bookingHistoryDataResponse.status ==
                                        'confirmed'
                                    ? 'Dikonfirmasi'
                                    : bookingHistoryDataResponse.status ==
                                            'in_progress'
                                        ? 'Sedang diproses'
                                        : bookingHistoryDataResponse.status ==
                                                'canceled'
                                            ? 'Dibatalkan'
                                            : bookingHistoryDataResponse
                                                        .status ==
                                                    'completed'
                                                ? 'Selesai'
                                                : '',
                            style: TextStyle(
                              color: bookingHistoryDataResponse.status ==
                                      'pending'
                                  ? AppColors.darkYellow
                                  : bookingHistoryDataResponse.status ==
                                          'confirmed'
                                      ? AppColors.darkBlue
                                      : bookingHistoryDataResponse.status ==
                                              'in_progress'
                                          ? AppColors.darkBlue
                                          : bookingHistoryDataResponse.status ==
                                                  'canceled'
                                              ? AppColors.darkRed
                                              : bookingHistoryDataResponse
                                                          .status ==
                                                      'completed'
                                                  ? AppColors.darkGreen
                                                  : AppColors
                                                      .black, // Default text color
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
