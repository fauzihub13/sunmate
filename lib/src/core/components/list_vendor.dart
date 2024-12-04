import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/data/models/vendor.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/vendor_card.dart';

class ListVendor extends StatelessWidget {
  final int? itemCount;
  const ListVendor({super.key, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true, // Menyesuaikan tinggi dengan jumlah item
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10.0,
        );
      },
      physics:
          const NeverScrollableScrollPhysics(), // Nonaktifkan scroll internal
      itemCount: itemCount != null
          ? itemCount!
          : vendorList.length, // Tambahkan jumlah item
      itemBuilder: (context, index) {
        final Vendor vendor = vendorList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: VendorCard(data: vendor),
        );
      },
    );
  }
}
