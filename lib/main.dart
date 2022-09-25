import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
     );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FlutterMap(
        options: MapOptions(
        center: LatLng(51.509364, -0.128928),
        zoom: 9.2,
        ),
        nonRotatedChildren: [
        AttributionWidget.defaultWidget(
        source: 'OpenStreetMap contributors',
        onSourceTapped: null,
        ),
        ],
        children: [
        TileLayer(
        urlTemplate: 'https://api.mapbox.com/styles/v1/saidianass/cl8hom8jg002615qrw43b25h5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FpZGlhbmFzcyIsImEiOiJjbDhob2RpbW8waXc2M3htcmM4dnI2aWcyIn0.umNwqqHTHTBrnAdbogIiMQ',
        additionalOptions: {
          'accessToken':'pk.eyJ1Ijoic2FpZGlhbmFzcyIsImEiOiJjbDhob2RpbW8waXc2M3htcmM4dnI2aWcyIn0.umNwqqHTHTBrnAdbogIiMQ',
          'id':'mapbox.mapbox-streets-v8',
        },
        userAgentPackageName: 'com.example.app',
        ),
        ],
        )
    );
  }
}
