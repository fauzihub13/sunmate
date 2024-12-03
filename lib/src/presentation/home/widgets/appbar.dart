import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;

  const MainAppBar({Key? key})
      : super(key: key); // Receive title as a parameter

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                          'Tonald Drump',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Selamat datang kembali!',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            CircleAvatar(
              radius: 25, // Size of the avatar
              backgroundColor:
                  AppColors.lightBlue, // Background color of the avatar
              child: GestureDetector(
                onTap: () {
                  // Your action when the icon is pressed
                  print('SVG Icon pressed!');
                },
                child: SvgPicture.asset(
                  'assets/icons/chat.svg', // Path to your SVG asset
                  // colorFilter: AppColors.primary,
                  width: 24, // Adjust icon size to fit
                  height: 24, // Adjust icon size to fit
                ),
              ),
            ),
          ],
        ));
  }

  // Define preferedSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
