import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/search_bar.dart';
import 'package:flutter_sunmate/src/core/components/vendor_card.dart';
import 'package:flutter_sunmate/src/data/models/vendor.dart';

class VendorListPage extends StatelessWidget {
  const VendorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return const MobileView();
      } else {
        return const MobileView();
      }
    });
  }
}

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final TextEditingController searchController = TextEditingController();
  List<Vendor> searchResults = [];
  final List<Vendor> vendors = vendorList;

  @override
  void initState() {
    super.initState();
    searchResults = vendors;
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchResults = vendors
          .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'SunList', canBack: true),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          children: [
            CustomSearchBar(
              controller: searchController,
              onChanged: _onSearchChanged,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(child: Text('Tidak ada hasil ditemukan.'))
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final Vendor vendor = searchResults[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: VendorCard(data: vendor),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
