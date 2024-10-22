import 'package:flutter/material.dart';

import '../authorization_screen/login.dart';
import '../authorization_screen/signup.dart';
import 'location.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is the homepage"),
        centerTitle: true,
      ),
      drawer: Drawer(
        width: 300.0,
          backgroundColor: Colors.blueGrey,
      ),
      body:SignUpApp() ,
    );
  }
}
