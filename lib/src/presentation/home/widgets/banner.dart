import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(18.0),
      margin: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 24.0,
        bottom: 24.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '25',
                  style: TextStyle(
                    fontSize: 36.0,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Cerah berawan',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Jakarta, Indonesia',
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/rainy.png',
                  width: 110,
                  height: 110,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
