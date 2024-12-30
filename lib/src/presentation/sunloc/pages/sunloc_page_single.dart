import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor_response_model.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/vendor_card.dart';
import 'package:latlong2/latlong.dart';

class SunlocPageSingle extends StatefulWidget {
  final SingleVendor vendor;
  // final double latitude, longitude;
  const SunlocPageSingle({super.key, required this.vendor});

  @override
  State<SunlocPageSingle> createState() => _SunlocPageSingleState();
}

class _SunlocPageSingleState extends State<SunlocPageSingle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Lokasi Vendor', canBack: true),
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
              initialCenter:
                  LatLng(widget.vendor.latitude!, widget.vendor.longitude!),
              initialZoom: 14,
              interactionOptions: const InteractionOptions(
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
                  point:
                      LatLng(widget.vendor.latitude!, widget.vendor.longitude!),
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
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: VendorCard(data: widget.vendor)),
          ),
        )
      ]),
    );
  }
}
