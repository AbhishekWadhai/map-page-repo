import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const LatLng currentPosition = LatLng(73.080646321,29.01638908);

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late String? imageString; // Make it nullable
  late GoogleMapController mapController;
  Map<String, Marker> markers = {};
  Set<Polygon> polygons = HashSet<Polygon>();
  List<LatLng> points = [
    LatLng(73.080646321, 29.01638908),
    LatLng(73.085775375, 29.016109667),
    LatLng(73.085736819, 29.013121103),
    LatLng(73.080674149, 29.013036368),
  ];

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getImage();
    polygons.add(
      Polygon(
        polygonId: PolygonId('1'),
        points: points,
        fillColor: Colors.red.withOpacity(0.3),
        strokeWidth: 2,
        strokeColor: Colors.blue,
        geodesic: true,
      ),
    );
  }

  getImage() async {
    try {
      const url = 'https://api.mapmycrop.com/satellite/field-imagery?'
          'api_key=424ddd23098841bbb64bb972d3ad177f&farm_id=30ee241065cf43ddac897e44ffb458d9'
          '&index=NDVI&satellite=S1&satellite_date=2023-12-08';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        imageString = json['image'];
        print(imageString);

        if (imageString != null) {
          setState(() {
            isLoaded = true;
          });
        }
      } else {
        print('Failed to load image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading image: $e');
    }
  }

  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF375A06),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 30,
          ),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        title: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Text(
            'Map Page',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Stack(
        children: [
          if (!isLoaded) Center(child: CircularProgressIndicator()), // Show loading indicator conditionally
          GoogleMap(
              initialCameraPosition: CameraPosition(
              target: currentPosition,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              mapController = controller;
              addMarker('1', currentPosition);
            },
            markers: markers.values.toSet(),
            polygons: polygons,

          ),
          if (isLoaded)
            Image.memory(
              base64Decode(imageString!),
              height: 300,
              width: 300,
            ),
        ],
      ),
    );
  }
  void addMarker(String markerId, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(markerId),
      position: location,
    );
    markers[markerId] = marker;
    setState(() {});
  }
}
