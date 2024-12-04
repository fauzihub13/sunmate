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
          MainAppBar(), // Tetap di tempat
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeBanner(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vendor Panel Surya',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          child: const Text(
                            'Selengkapnya',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.0),
                  ListVendor(
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
