import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/search_bar.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor_response_model.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/vendor_card.dart';

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

  List<SingleVendor> searchResults = [];
  // final List<Vendor> vendors = vendorList;

  @override
  void initState() {
    super.initState();
    context.read<VendorListBloc>().add(const VendorListEvent.getAllVendor());
    // searchResults = vendors;
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchResults = searchResults
          .where((e) => e.name!.toLowerCase().contains(value.toLowerCase()))
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
            Expanded(child: BlocBuilder<VendorListBloc, VendorListState>(
                builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(child: Text('Fetching vendors...'));
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                loaded: (vendors) {
                  searchResults = vendors;
                  final filteredVendors = searchController.text.isEmpty
                      ? searchResults
                      : searchResults
                          .where((vendor) => vendor.name!
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase()))
                          .toList();
                  return filteredVendors.isEmpty
                      ? const Center(child: Text('No results found.'))
                      : ListView.builder(
                          itemCount: filteredVendors.length,
                          itemBuilder: (context, index) {
                            final vendor = filteredVendors[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: VendorCard(data: vendor),
                            );
                          },
                        );
                },
                error: (message) => Center(child: Text('Error: $message')),
              );
            })),
          ],
        ),
      ),
    );
  }
}
