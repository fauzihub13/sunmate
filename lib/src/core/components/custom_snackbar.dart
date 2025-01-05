import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class CustomSnackbar {
  static void show(BuildContext context,
      {required String message,
      double? marginVertical = 10,
      double? marginHorizontal = 16,
      required String status,
      int? duration = 3}) {
        Color backgroundColor;
    if (status == 'success') {
      backgroundColor = AppColors.green; 
    } else if (status == 'fail') {
      backgroundColor = AppColors.red; 
    } else if (status == 'warning') {
      backgroundColor = AppColors.yellow;
    } else {
      backgroundColor = AppColors.primary;

    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(
            horizontal: marginHorizontal!, vertical: marginVertical!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(seconds: duration!),
      ),
    );
  }
}
