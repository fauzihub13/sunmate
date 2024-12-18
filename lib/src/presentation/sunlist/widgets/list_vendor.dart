import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor.dart';

class ListVendor extends StatelessWidget {
  final int? itemCount;
  const ListVendor({super.key, this.itemCount});

  @override
  Widget build(BuildContext context) {
    final int count = itemCount ?? vendorList.length;

    return Column(
        // children: List.generate(
        //   count,
        //   (index) {
        //     final SingleVendor vendor = vendorList[index];
        //     return Padding(
        //       padding: const EdgeInsets.symmetric(
        //           horizontal: 16.0,
        //           vertical: 5.0),
        //       child: VendorCard(data: vendor),
        //     );
        //   },
        // ),
        );
  }
}
