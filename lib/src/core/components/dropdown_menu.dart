import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

enum FormStyle { filled, outlined }



class DropdownFormInput<T> extends StatelessWidget {
  const DropdownFormInput({
    super.key,
    required this.value,
    required this.items,
    this.labelText,
    this.dropDownStyle = FormStyle.filled,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.borderRadius = 16.0,
    this.onChanged,
    this.validator,
  });

  final T? value;
  final List<DropdownMenuItem<T>> items;
  final String? labelText;
  final FormStyle dropDownStyle;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final double borderRadius;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: enabled ? onChanged : null,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle: const TextStyle(color: AppColors.darkBlue),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: dropDownStyle == FormStyle.filled,
        fillColor: dropDownStyle == FormStyle.filled ? AppColors.lightBlue : null,
        enabledBorder: dropDownStyle == FormStyle.outlined
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
        border: dropDownStyle == FormStyle.outlined
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
