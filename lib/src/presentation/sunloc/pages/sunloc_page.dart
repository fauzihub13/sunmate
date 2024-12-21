import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:latlong2/latlong.dart';

class SunlocPage extends StatefulWidget {
  const SunlocPage({super.key});

  @override
  State<SunlocPage> createState() => _SunlocPageState();
}

class _SunlocPageState extends State<SunlocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Lokasi Vendor', canBack: true),
      body: FlutterMap(
        options: const MapOptions(
            initialCenter: LatLng(-6.200000, 106.816666),
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
                point: LatLng(-6.200000, 106.816666),
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
    );
  }
}
