import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/search_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor_response_model.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/vendor_card.dart';
import 'package:latlong2/latlong.dart';

class SunlocPage extends StatefulWidget {
  // final double latitude, longitude;
  const SunlocPage({super.key});

  @override
  State<SunlocPage> createState() => _SunlocPageState();
}

class _SunlocPageState extends State<SunlocPage> {
  final TextEditingController searchController = TextEditingController();

  List<SingleVendor> searchResults = [];
  bool isClicked = false;
  SingleVendor? singleVendor;
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

  // Future<void> _refreshPage() async {
  //   context.read<VendorListBloc>().add(const VendorListEvent.getAllVendor());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'SunLoc', canBack: true),
      body: Stack(children: [
        FlutterMap(
          options: const MapOptions(
              initialCenter: LatLng(-6.56178900, 107.43203400),
              initialZoom: 14,
              interactionOptions: InteractionOptions(
                flags: InteractiveFlag.doubleTapZoom |
                    InteractiveFlag.drag |
                    InteractiveFlag.pinchZoom,
              )),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            BlocConsumer<VendorListBloc, VendorListState>(
              listener: (context, state) {},
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loaded: (vendors) {
                    final markers = vendors.map((vendor) {
                      return Marker(
                        point: LatLng(vendor.latitude!, vendor.longitude!),
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              singleVendor = vendor;
                              isClicked = true;
                            });
                          },
                          child: SizedBox(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 40,
                                  color: AppColors.primary,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  vendor.name!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkBlue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList();
                    return MarkerLayer(markers: markers);
                  },
                );
              },
            ),
          ],
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SearchInput(
                controller: searchController,
                borderRadius: BorderRadius.circular(42),
              ),
            )),
        if (isClicked)
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: VendorCard(data: singleVendor!)),
            ),
          )
        // Positioned(
        //   bottom: 0,
        //   child: SizedBox(
        //     width: MediaQuery.of(context).size.width,
        //     child: Padding(
        //         padding: const EdgeInsets.all(16),
        //         child: VendorCard(data: widget.vendor)),
        //   ),
        // )
      ]),
    );
  }
}
