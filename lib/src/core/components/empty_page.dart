import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class EmptyPage extends StatelessWidget {
  final String message;
  final num? searchBarHeight;
  const EmptyPage({super.key, required this.message, this.searchBarHeight = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
                color: AppColors.white,
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    searchBarHeight!,
                child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(message))),
          ),
        ),
      ],
    );
  }
}
