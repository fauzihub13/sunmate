import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(18.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
          // Kolom kiri dengan 2 elemen
          const Expanded(
            flex: 2, // Menentukan proporsi 2 untuk kolom kiri
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

          // Kolom kanan dengan 1 elemen
          Expanded(
            flex: 1, // Menentukan proporsi 1 untuk kolom kanan
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
