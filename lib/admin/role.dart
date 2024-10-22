import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../authorization_screen/user/user_part.dart';
import 'Myuser.dart';
import 'error_while_login.dart';
import 'model.dart';
import 'my_admin.dart';

class MainScreen extends StatelessWidget {
  final User user;

  MainScreen({required this.user});

  @override
  Widget build(BuildContext context) {

    switch (user.role) {
      case UserRole.Admin:
        return AdminScreen(user: user);
      case UserRole.Employer:
        return EmployerScreen(user: user);
      case UserRole.Employee:
        return EmployeeScreen(user: user);
      default:
        return ErrorScreen(); // In case of an unknown role
    }
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
        title: Text("Employer Location"),
      ),
      body: Center( // Wrap the whole content in Center
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your Location: $currentAddress",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center, // Ensure text is centered
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
      ),
    );
  }
}
