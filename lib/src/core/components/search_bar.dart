import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/search_input.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchInput(
            controller: controller,
            onChanged: onChanged,
            hintText: 'Cari menu...',
          ),
        ),
      ],
    );
  }
}
