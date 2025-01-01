import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final double iconSize;
  final String iconUrl;
  final VoidCallback onTap;
  const MenuCard(
      {super.key,
      required this.title,
      required this.iconSize,
      required this.iconUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconUrl,
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                width: iconSize,
                height: iconSize,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: AppColors.darkBlue),
          )
        ],
      ),
    );
  }
}
