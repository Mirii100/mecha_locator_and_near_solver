import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../admin/model.dart';

class EmployerScreen extends StatelessWidget {
  final User user;

  EmployerScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("client dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality to pick location on a map
              },
              child: Text('Pick Location'),
            ),
          ],
        ),
      ),
    );
  }
}
