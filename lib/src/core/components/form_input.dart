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
    this.readOnly = false,
    this.borderRadius = 16.0,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onTap,
  });

  final TextEditingController controller;
  final String? labelText;
  final FormStyle style;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final double borderRadius;
  final int maxLines;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle: const TextStyle(color: AppColors.darkBlue),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: style == FormStyle.filled,
        fillColor: style == FormStyle.filled ? AppColors.lightBlue : null,
        enabledBorder: style == FormStyle.outlined
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(color: AppColors.primary),
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
          borderSide: const BorderSide(color: AppColors.primary),
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
    );
  }
}
