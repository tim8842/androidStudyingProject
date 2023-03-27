import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  // static const LatLng sourceLocation = LatLng(37.33, -122.032);
  // static const LatLng destination = LatLng(37.3342, -122.066);

  @override
  Widget build(BuildContext context) {
    final point = LatLng(55.994333, 92.797481);
    return Scaffold(
        appBar: AppBar(title: const Text('Карта')),
        body: Stack(
          children: [
            FlutterMap(
              options:
                  MapOptions(center: LatLng(55.994333, 92.797481), zoom: 16.0),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        point: point,
                        builder: (ctx) => const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ))
                  ],
                )
              ],
            ),
          ],
        )
        // body: Image.asset('assets/png/map.png'),
        // body: const GoogleMap(
        //     initialCameraPosition:
        //         CameraPosition(target: sourceLocation, zoom: 14.5)),
        );
  }
}
