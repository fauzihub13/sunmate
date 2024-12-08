import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/vendor_history_card.dart';

class VendorBookingHistory extends StatelessWidget {
  const VendorBookingHistory({super.key});

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
  // final TextEditingController searchController = TextEditingController();

  // List<VendorBookingModel> searchResults = [];
  // final List<VendorBookingModel> vendors = vendorList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Riwayat Booking', canBack: true),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          children: [
            // CustomSearchBar(
            //   controller: searchController,
            //   onChanged: _onSearchChanged,
            // ),
            const SizedBox(height: 16.0),
            VendorHistoryCard(),
            const SizedBox(
              height: 14.0,
            ),
            VendorHistoryCard()
          ],
        ),
      ),
    );
  }
}
