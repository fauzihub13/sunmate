import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

enum FormStyle { filled, outlined }

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    required this.controller,
    this.labelText,
    this.style = FormStyle.filled,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.borderRadius = 16.0,
    this.height = 50.0,
  });

  final TextEditingController controller;
  final String? labelText;
  final FormStyle style;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final double borderRadius;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: style == FormStyle.filled,
          fillColor: style == FormStyle.filled ? AppColors.lightBlue : null,
          enabledBorder: style == FormStyle.outlined
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                )
              : UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide.none,
                ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: AppColors.disabled),
          ),
          border: style == FormStyle.outlined
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                )
              : UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide.none,
                ),
        ),
      ),
    );
  }
}
