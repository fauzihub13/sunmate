import 'package:flutter/cupertino.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class RectangleCircular extends StatelessWidget {
  const RectangleCircular(
      {super.key,
      this.size = 400,
      this.backgroundColor = AppColors.overlayBlue,
      this.borderWidth = 4.0,
      this.borderColor = AppColors.overlayBlue});

  final double? size;
  final Color? backgroundColor;
  final double? borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor!, width: borderWidth!),
          color: backgroundColor),
    );
  }
}
