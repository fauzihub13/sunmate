import 'package:flutter/widgets.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/notification/notification_response_model.dart'
    as notification_response;
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CardNotification extends StatelessWidget {
  final notification_response.Notification notification;
  const CardNotification({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    var notificationType = {
      'info': 'assets/icons/notification/icon_notification.svg',
      'vendor': 'assets/icons/notification/icon_vendor.svg',
      'news': 'assets/icons/notification/icon_news.svg',
      'booking': 'assets/icons/notification/icon_booking.svg'
    };

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(
                bottom: BorderSide(width: 1.5, color: AppColors.lightBlue))),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    notificationType[notification.type!]!,
                    colorFilter: const ColorFilter.mode(
                        AppColors.primary, BlendMode.srcIn),
                    width: 34,
                    height: 34,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      notification.title!,
                      style: const TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      notification.body!,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      DateFormat('dd MMMM yyyy hh:mm')
                          .format(notification.createdAt!),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
