import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class HomeBanner extends StatelessWidget {
  final double temperature;
  final String location;
  final String weather;

  const HomeBanner({
    super.key,
    required this.temperature,
    required this.location,
    required this.weather,
  });

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
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${temperature.toStringAsFixed(1)}°C', // Format suhu
                  style: const TextStyle(
                    fontSize: 34.0,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  weather,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(color: AppColors.white, fontSize: 18),
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
                  'assets/images/rainy.png', // Gambar sesuai cuaca
                  width: 110,
                  height: 110,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
