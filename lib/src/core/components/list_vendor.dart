import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/data/models/vendor.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/vendor_card.dart';

class ListVendor extends StatelessWidget {
  final int? itemCount;
  const ListVendor({super.key, this.itemCount});

  @override
  Widget build(BuildContext context) {
    final int count = itemCount ?? vendorList.length;

    return Column(
      children: List.generate(
        count,
        (index) {
          final Vendor vendor = vendorList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 5.0), // Tambahkan vertical spacing di sini
            child: VendorCard(data: vendor),
          );
        },
      ),
    );
  }
}
