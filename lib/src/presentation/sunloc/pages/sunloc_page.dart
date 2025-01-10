import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/core/components/search_input.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor/vendor_response_model.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/vendor_card.dart';
import 'package:flutter_sunmate/src/presentation/sunloc/widgets/vendor_search_card.dart';
import 'package:latlong2/latlong.dart';

class SunlocPage extends StatefulWidget {
  const SunlocPage({super.key});

  @override
  State<SunlocPage> createState() => _SunlocPageState();
}

class _SunlocPageState extends State<SunlocPage> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final MapController mapController = MapController();

  List<SingleVendor> allVendors = [];
  List<SingleVendor> searchResults = [];
  bool isClicked = false;
  SingleVendor? singleVendor;
  LatLng? latLng;

  @override
  void initState() {
    super.initState();
    context.read<VendorListBloc>().add(const VendorListEvent.getAllVendor());
    searchController.addListener(() {
      _onSearchChanged(searchController.text);
    });
  }

  void _moveCamera(LatLng position, {double zoom = 14}) {
    mapController.move(position, zoom);
  }

  void _onSearchChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        searchResults = [];
      } else {
        searchResults = allVendors
            .where((vendor) =>
                vendor.name!.toLowerCase().contains(value.toLowerCase()) ||
                vendor.address!.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: latLng ??
                    const LatLng(-6.175221728517849, 106.82715279552818),
                initialZoom: 14,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.doubleTapZoom |
                      InteractiveFlag.drag |
                      InteractiveFlag.pinchZoom,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                ),
                BlocConsumer<VendorListBloc, VendorListState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (vendors) {
                        if (vendors.isNotEmpty && latLng == null) {
                          setState(() {
                            allVendors = vendors;
                            latLng = LatLng(
                              vendors[0].latitude!,
                              vendors[0].longitude!,
                            );
                            _moveCamera(latLng!);
                          });
                        }
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const Center(
                        child: CustomLoadingIndicator(),
                      ),
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
                                  latLng = LatLng(
                                      vendor.latitude!, vendor.longitude!);
                                  _moveCamera(latLng!);
                                });
                              },
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 40,
                                    color: AppColors.primary,
                                  ),
                                  Text(
                                    vendor.name!,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkBlue,
                                    ),
                                  ),
                                ],
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    SearchInput(
                      focusNode: searchFocusNode,
                      controller: searchController,
                      borderRadius: BorderRadius.circular(42),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                searchController.clear();
                                setState(() {
                                  searchResults = [];
                                });
                              },
                              icon: const Icon(Icons.close),
                            )
                          : null,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (searchResults.isNotEmpty)
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            border:
                                Border.all(width: 1, color: AppColors.white),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              final vendor = searchResults[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        singleVendor = vendor;
                                        isClicked = true;
                                        latLng = LatLng(vendor.latitude!,
                                            vendor.longitude!);
                                        _moveCamera(latLng!);
                                        searchController.text = vendor.name!;
                                        searchResults = [];
                                      });
                                    },
                                    child: VendorSearchCard(vendor: vendor)),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (isClicked)
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: VendorCard(data: singleVendor!),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
