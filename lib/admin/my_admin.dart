import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mechanics/mechanic.dart';
import 'model.dart';

class AdminScreen extends StatelessWidget {
  final User user;

  AdminScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mechanic Dashboard"),
      ),
      body: Center(
        child:
          Stack(children: [
            Center(
                child: Text("Welcome Admin ${user.name}. You have full privileges.")),
            UserForm(),
          ],
      ),

      ),
    );
  }
}
