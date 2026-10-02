import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(31.987418222765022, 35.877207735653826),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(31.988314346094164, 35.87522142263353),
    ),
  ];

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text("Please Select Map Type"),
                          TextButton(
                            onPressed: () {
                              mapType = MapType.satellite;
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Text("satellite"),
                          ),
                          TextButton(
                            onPressed: () {
                              mapType = MapType.normal;
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Text("normal"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: GoogleMap(
        onTap: (argument) {
          markers.add(
            Marker(
              markerId: MarkerId("3"),
              position: LatLng(argument.latitude, argument.longitude),
            ),
          );
          setState(() {});
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(31.988309169271922, 35.87587850340457),
          zoom: 20,
        ),
        myLocationEnabled: true,
        mapType: mapType,
        myLocationButtonEnabled: true,
        markers: markers.toSet(),
      ),
    );
  }
}
