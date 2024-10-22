import 'package:flutter/material.dart';

import '../admin/role.dart';
import '../authorization_screen/drawer.dart';
import '../authorization_screen/login.dart';
import '../authorization_screen/signup.dart';
import '../my_login.dart';
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
      drawer: AppDrawer(),
      body:LoginScreen() ,
    );
  }
}
