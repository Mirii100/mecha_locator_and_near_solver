import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart'; // Import the geocoding package
import '../mechanics/mechanic.dart';
import 'model.dart';

class EmployeeScreen extends StatelessWidget {
  final User user;

  EmployeeScreen({required this.user});

  // Sample employer location (latitude and longitude)
  final LatLng employerLocation = LatLng(37.42796133580664, -122.085749655962);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserForm(),
            ElevatedButton(
              onPressed: () async {
                Position position = await _determinePosition();
                String address = await _getAddressFromLatLng(position);
                _showMap(context, position, address);
              },
              child: Text("View user Location on Map"),
            ),
          ],
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<String> _getAddressFromLatLng(Position position) async {
    // Use the Geocoding package to get address details
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      return '${place.locality}, ${place.administrativeArea}, ${place.country}'; // Format: City, State, Country
    } else {
      return 'Unknown location';
    }
  }

  void _showMap(BuildContext context, Position position, String address) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(
          currentPosition: LatLng(position.latitude, position.longitude),
          employerLocation: employerLocation,
          currentAddress: address,
        ),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  final LatLng currentPosition;
  final LatLng employerLocation;
  final String currentAddress;

  MapScreen({
    required this.currentPosition,
    required this.employerLocation,
    required this.currentAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my Location"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your Location: $currentAddress",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: employerLocation,
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('employer'),
                  position: employerLocation,
                  infoWindow: InfoWindow(title: 'Employer Location'),
                ),
                Marker(
                  markerId: MarkerId('current'),
                  position: currentPosition,
                  infoWindow: InfoWindow(title: 'Your Location'),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
