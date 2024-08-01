import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurante_app/model/placeLocation.dart';

class MapScreen extends StatefulWidget {
  final bool isReadonly;
  final PlaceLocation initialLocation;

  MapScreen(
      {this.initialLocation = const PlaceLocation(
        latitude: -5.832018712485999,
        longitude: -35.20552792202877,
      ),
      this.isReadonly = false});

  @override
  _MapScreenState createState() => _MapScreenState();
}

void showError(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Por favor, selecione uma localização!'),
    ),
  );
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione...'),
        actions: <Widget>[
          if (!widget.isReadonly)
            IconButton(
              onPressed: _pickedPosition == null
                  ? () => showError(context)
                  : () {
                      Navigator.of(context).pop(_pickedPosition);
                    },
              icon: Icon(Icons.check),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget.isReadonly ? null : _selectPosition,
        markers: _pickedPosition == null
            ? {}
            : {
                Marker(
                  markerId: MarkerId('p1'),
                  position: _pickedPosition!,
                ),
              },
      ),
    );
  }
}
