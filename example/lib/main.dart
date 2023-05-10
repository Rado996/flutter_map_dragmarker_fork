import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_dragmarker/dragmarker.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(const TestApp());

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  TestAppState createState() => TestAppState();
}

class TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(45.5231, -122.6765),
              zoom: 6.4,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              DragMarkers(
                markers: [
                  DragMarker(
                    point: LatLng(45.2131, -122.6765),
                    width: 80.0,
                    height: 80.0,
                    offset: const Offset(0.0, -8.0),
                    builder: (ctx) => const Icon(Icons.location_on, size: 50),
                    onDragStart: (details, point) =>
                        debugPrint("Start point $point"),
                    onDragEnd: (details, point) =>
                        debugPrint("End point $point"),
                    onTap: (point) => debugPrint("on tap"),
                    onLongPress: (point) => debugPrint("on long press"),
                    feedbackBuilder: (ctx) =>
                        const Icon(Icons.edit_location, size: 75),
                    feedbackOffset: const Offset(0.0, -18.0),
                    updateMapNearEdge: true,
                    nearEdgeRatio: 2.0,
                    nearEdgeSpeed: 1.0,
                  ),
                  DragMarker(
                    point: LatLng(45.535, -122.675),
                    width: 80.0,
                    height: 80.0,
                    builder: (ctx) => const Icon(Icons.location_on, size: 50),
                    onDragEnd: (details, point) =>
                        debugPrint('Finished Drag $details $point'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
