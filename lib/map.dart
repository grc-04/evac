import 'dart:math';
import 'package:evac/position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;

import 'package:flutter_map/flutter_map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.position});
  final Position1 position;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(double.parse('${widget.position.lat}'),
              double.parse('${widget.position.long}')),
          zoom: 12,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            tileSize: 256,
            urlTemplate:
                'https://api.mapbox.com/styles/v1/anshb7/clek5kd28000v01pjt8jjgve5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5zaGI3IiwiYSI6ImNsZWs0Nnc0ZjBocnczeGs1MnplY3E4cDUifQ.0oe7Nurwk6nopf6V17S7Ig',
            additionalOptions: {
              "accessToken":
                  "pk.eyJ1IjoiYW5zaGI3IiwiYSI6ImNsZWs0Nnc0ZjBocnczeGs1MnplY3E4cDUifQ.0oe7Nurwk6nopf6V17S7Ig",
              "id": "mapbox.mapbox-streets-v8"
            },
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: latLng.LatLng(double.parse('${widget.position.lat}'),
                    double.parse('${widget.position.long}')),
                width: 80,
                height: 80,
                builder: (context) => GestureDetector(
                  onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Hostel C',
                                style: TextStyle(fontFamily: "Product")),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('Check In'),
                              ),
                            ],
                          )),
                  child: Icon(
                    Icons.location_on,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ),
              Marker(
                point: latLng.LatLng(30.364326286196157, 76.40316922197903),
                width: 80,
                height: 80,
                builder: (context) => GestureDetector(
                  onTap: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Jaggi',
                                  style: TextStyle(fontFamily: "Product")),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('Check In'),
                                ),
                              ],
                            ));
                  },
                  child: Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                ),
              ),
              Marker(
                point: latLng.LatLng(30.36168333263183, 76.37268300637672),
                width: 80,
                height: 80,
                builder: (context) => GestureDetector(
                  onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'Romatini',
                              style: TextStyle(fontFamily: "Product"),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('Check In'),
                              ),
                            ],
                          )),
                  child: Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                ),
              ),
              Marker(
                point: latLng.LatLng(30.361535214179476, 76.37285466775579),
                width: 80,
                height: 80,
                builder: (context) => GestureDetector(
                  onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'Romatini',
                              style: TextStyle(fontFamily: "Product"),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('Check In'),
                              ),
                            ],
                          )),
                  child: Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
