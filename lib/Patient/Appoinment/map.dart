import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  final LatLng initialLocation;

  MapScreen({required this.initialLocation});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.initialLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF398AE5),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: widget.initialLocation,
          zoom: 13.0,
          onTap: _handleTap,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              if (_selectedLocation != null)
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: _selectedLocation!,
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40.0,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedLocation != null ? _selectLocation : null,
        child: Icon(Icons.check),
      ),
    );
  }

 void _handleTap(tapPosition, LatLng latLng) {
  setState(() {
    _selectedLocation = latLng;
  });
}


  void _selectLocation() {
    Navigator.pop(context, _selectedLocation);
  }
}
