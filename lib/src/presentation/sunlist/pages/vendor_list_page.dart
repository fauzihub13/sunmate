import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/search_bar.dart';
import 'package:flutter_sunmate/src/data/models/vendor.dart';

class VendorListPage extends StatelessWidget {
  const VendorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return MobileView();
      } else {
        return MobileView();
      }
    });
  }
}

class MobileView extends StatelessWidget {
  final searchController = TextEditingController();

  MobileView({super.key});
  List<Vendor> searchResults = [];
  final List<Vendor> products = vendorList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'SunNews', canBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomSearchBar(
              controller: searchController,
            ),
          ],
        ),
      ),
    );
  }
}
