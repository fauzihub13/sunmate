import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/notification/pages/notification_list_page.dart';

class MainAppBar extends StatefulWidget {
  final String userName;
  final dynamic avatar;
  const MainAppBar({super.key, required this.userName, required this.avatar});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
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
          scrolledUnderElevation: 0.0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightBlue,
                radius: 26.0,
                backgroundImage: widget.avatar != null &&
                        widget.avatar!.isNotEmpty
                    ? NetworkImage(widget.avatar!)
                    : const AssetImage('assets/images/avatar-place-holder.png')
                        as ImageProvider,
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
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
                      style:
                          TextStyle(fontSize: 14.0, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const NotificationListPage();
                  }));
                },
                child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.lightBlue,
                    child: Icon(
                      Icons.notifications,
                      color: AppColors.primary,
                    )),
              ),
            ],
          )),
    );
  }
}
