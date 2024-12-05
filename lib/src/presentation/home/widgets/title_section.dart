import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  
  const TitleSection({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 16.0,
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w600),
        ),
        TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all<Size>(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onPressed,
          child: const Text(
            'Selengkapnya',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14.0,
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
