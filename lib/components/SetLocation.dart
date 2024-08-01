import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart';
import '../screens/mapsScreen.dart';
import '../utils/maps_util.dart';

class LocationInput extends StatefulWidget {
  final Function(String) onSelectStreet;

  LocationInput({required this.onSelectStreet});

  @override
  LocationInputState createState() => LocationInputState();
}

class LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  String? _streetName;

  Future<void> _getCurrentUserLocation() async {
    final locData = await loc.Location().getLocation();
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: locData.latitude!,
      longitude: locData.longitude!,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });

    _getStreetName(locData.latitude!, locData.longitude!);
  }

  Future<void> _getStreetName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        setState(() {
          _streetName = placemarks.first.street;
        });
        print('Street name: ${placemarks.first.street}');
      } else {
        print('No placemarks found');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUserLocation();
  }

  Future<void> _selectOnMap() async {
    LatLng selectedPosition = LatLng(-5.832018712485999, -35.20552792202877);
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => MapScreen(),
      ),
    );

    if (result != null && result is LatLng) {
      selectedPosition = result;
    }

    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: selectedPosition.latitude,
      longitude: selectedPosition.longitude,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });

    _getStreetName(selectedPosition.latitude, selectedPosition.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? Text('Localização não informada!')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Localização atual'),
              onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text('Selecione no Mapa'),
              onPressed: _selectOnMap,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, _streetName ?? 'Não informado');
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
