import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_booking_history.dart';
import 'package:flutter_svg/svg.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;

  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: AppColors.greyShadow, blurRadius: 6.0, offset: Offset(0, 1))
      ]),
      child: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 26.0, // Adjust the size of the avatar here
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      ),
                      SizedBox(width: 14.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SunMate',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkBlue),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            'Sahabat panel suryamu!',
                            style: TextStyle(
                                fontSize: 14.0, color: AppColors.primary),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.lightBlue,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const VendorBookingHistory();
                    }));
                  },
                  child: SvgPicture.asset(
                    'assets/icons/history.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  // Define preferedSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
