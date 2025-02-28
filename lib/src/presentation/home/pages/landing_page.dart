import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/auth/auth_response_model.dart';
import 'package:flutter_sunmate/src/presentation/home/pages/home_page.dart';
import 'package:flutter_sunmate/src/presentation/profile/pages/account_profile_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_booking_history_page.dart';
import 'package:flutter_sunmate/src/presentation/sunloc/pages/sunloc_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? user;
  int _selectedIndex = 0;

  final _menuItems = [
    const GButton(
      icon: Icons.home_filled,
      iconColor: AppColors.disabled,
      iconActiveColor: AppColors.primary,
      text: 'Beranda',
      textColor: AppColors.primary,
      backgroundColor: AppColors.lightBlue,
    ),
    const GButton(
      icon: Icons.location_on,
      iconColor: AppColors.disabled,
      iconActiveColor: AppColors.primary,
      text: 'SunLoc',
      textColor: AppColors.primary,
      backgroundColor: AppColors.lightBlue,
    ),
    const GButton(
      icon: Icons.history,
      iconColor: AppColors.disabled,
      iconActiveColor: AppColors.primary,
      text: 'Riwayat',
      textColor: AppColors.primary,
      backgroundColor: AppColors.lightBlue,
    ),
    const GButton(
      icon: Icons.person,
      iconColor: AppColors.disabled,
      iconActiveColor: AppColors.primary,
      text: 'Profil',
      textColor: AppColors.primary,
      backgroundColor: AppColors.lightBlue,
    ),
  ];

  final List<Widget> _pages = [
    const HomePage(),
    const SunlocPage(),
    const VendorBookingHistoryPage(),
    const AccountProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 252, 252, 252),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            backgroundColor: Colors.transparent,
            gap: 4.0,
            padding: const EdgeInsets.all(10),
            tabs: _menuItems,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
