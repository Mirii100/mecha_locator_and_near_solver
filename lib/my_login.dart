import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admin/model.dart';
import 'admin/role.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(

        child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // For demonstration, login as Admin
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen(
                      user: User(name: "AdminUser", email: "admin@example.com", role: UserRole.Admin))),
                );
              },
              child: Text("Login as Admin"),
            ),
            ElevatedButton(
              onPressed: () {
                // For demonstration, login as Employer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen(
                      user: User(name: "EmployerUser", email: "employer@example.com", role: UserRole.Employer))),
                );
              },
              child: Text("Login as Employer"),
            ),
            ElevatedButton(
              onPressed: () {
                // For demonstration, login as Employee
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen(user:
                  User(name: "EmployeeUser", email: "employee@example.com", role: UserRole.Employee))),
                );
              },
              child: Text("Login as user"),
            ),
          ],
        ),
            ),
      );
  }
}
