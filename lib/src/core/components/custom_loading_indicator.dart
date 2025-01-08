import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final Color? backgroundColor;
  final double? strokeWidth;
  final Color? valueColor;

  const CustomLoadingIndicator(
      {super.key,
      this.backgroundColor = AppColors.grey,
      this.strokeWidth = 5,
      this.valueColor = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: backgroundColor!,
      strokeWidth: strokeWidth!,
      valueColor: AlwaysStoppedAnimation<Color>(valueColor!),
      strokeCap: StrokeCap.round,
    );
  }
}
