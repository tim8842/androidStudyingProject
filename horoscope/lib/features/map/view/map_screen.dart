import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const LatLng sourceLocation = LatLng(37.33, -122.032);
  static const LatLng destination = LatLng(37.3342, -122.066);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Карта')),
      body: Image.asset('assets/png/map.png'),
      // body: const GoogleMap(
      //     initialCameraPosition:
      //         CameraPosition(target: sourceLocation, zoom: 14.5)),
    );
  }
}
