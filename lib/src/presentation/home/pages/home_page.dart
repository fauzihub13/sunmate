import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/list_vendor.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/appbar.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appBarTitle = 'SunMate'; // Initial title

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(), // Tetap di tempat
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeBanner(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vendor Panel Surya',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all<EdgeInsets>(
                                EdgeInsets.zero), // Removes padding
                            minimumSize: WidgetStateProperty.all<Size>(
                                Size.zero), // Removes minimum size constraints
                            tapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // Reduces the button size to fit the text
                          ),
                          onPressed: () {},
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
                    ),
                  ),
                  const ListVendor(
                    itemCount: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
