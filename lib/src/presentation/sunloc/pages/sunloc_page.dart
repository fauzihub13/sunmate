import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor_response_model.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
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

  Future<void> _refreshPage() async {
    context.read<VendorListBloc>().add(const VendorListEvent.getAllVendor());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'SunLoc', canBack: true),
      body: Stack(children: [
        FlutterMap(
          options: const MapOptions(
              // initialCenter:
              //     LatLng(widget.vendor.latitude!, widget.vendor.longitude!),
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
            MarkerLayer(markers: [
              Marker(
                  point: const LatLng(-6.222840, 106.847756),
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: const Icon(
                      Icons.location_on,
                      size: 40,
                      color: AppColors.primary,
                    ),
                  )),
            ])
          ],
        ),
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
