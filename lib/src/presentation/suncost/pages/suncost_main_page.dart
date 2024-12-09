import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';

class SuncostMainPage extends StatefulWidget {
  const SuncostMainPage({super.key});

  @override
  State<SuncostMainPage> createState() => _SunCostMainPageState();
}

class _SunCostMainPageState extends State<SuncostMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'SunCost', canBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Button.filled(
          label: 'Hitung',
          onPressed: () {},
        ),
      ),
    );
  }
}
