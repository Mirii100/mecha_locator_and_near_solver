import 'package:flutter/material.dart';

import 'admin/try.dart';
import 'authorization_screen/drawer.dart';
import 'authorization_screen/signup.dart';
import 'my_login.dart';
import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Homepage() ,

      routes: {
        '/signup': (context) => SignUpApp(), // Add this route for Signup
        '/profile': (context) => LoginScreen(),
        '/settings': (context) => LoginPage(),
      },
    );
  }
}

