import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class MainAppBar extends StatefulWidget {
  final String userName;
  const MainAppBar({super.key, required this.userName});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    // const bool isWeb = identical(0, 0.0);

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
              Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 26.0,
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      ),
                      const SizedBox(width: 14.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userName,
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkBlue),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          const Text(
                            'Selamat datang di Sunify',
                            style: TextStyle(
                                fontSize: 14.0, color: AppColors.primary),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
