import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlong/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
     );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double long = 49.5;
  double lat = -0.09;
  LatLng point = LatLng(49.5, -0.09);
  var location = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            onTap: (p) async{
              location = await Geocoder.local.findAddressesFromCoordinates(Coordinates(p.latitude, p.longitude));
              setState(() {
                point = p;
              });
            },
            center: LatLng(49.5,-0.09), //Position the map in the center of certain coordinates
            zoom: 10.0
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a','b','c'],
            ),
            MarkerLayerOptions(markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: point,
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 30.0,
                  ),
                ),
              )
            ]),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on_outlined),
                    hintText: "Search for Location",
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
              ),

              Card(child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("${location.first.countryName}, ${location.first.locality}, ${location.first.featureName}", style: TextStyle(fontWeight: FontWeight.bold)),
              ),),
            ]
          ),
        )
      ],

    );
  }
}
