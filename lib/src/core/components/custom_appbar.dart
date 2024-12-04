import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canBack;

  const CustomAppbar({super.key, required this.title, required this.canBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        // BoxShadow(
        //     color: AppColors.greyShadow, blurRadius: 6.0, offset: Offset(0, 1))
      ]),
      child: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Posisi elemen seimbang
            children: [
              Container(
                width: 40, // Lebar kotak
                height: 40, // Tinggi kotak
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 226, 226, 226), // Warna border abu-abu
                    width: 0.7, // Ketebalan border
                  ),
                  borderRadius: BorderRadius.circular(12), // Sudut membulat
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/back.svg', // Path file SVG
                    color: AppColors.darkBlue, // Warna ikon
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(
                  width: 48), // Placeholder untuk mengimbangi ikon back
            ],
          ),
        ),
      ),
    );
  }

  // Define preferedSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
