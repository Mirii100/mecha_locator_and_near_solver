import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mecha_locator_and_near_solver/admin/role.dart';

import 'model.dart'; // Ensure to import the MainScreen

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Again'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        primary: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.blue,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    email = value!;
                  },
                  validator: (value) {
                    if (value == null || !EmailValidator.validate(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password),
                    prefixIconColor: Colors.blue,
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    password = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Here you would typically validate the user's credentials
                      // For demonstration, let's use hardcoded users
                      User currentUser;

                      // Simple logic to determine user role
                      if (email == "admin@example.com" && password == "adminpass") {
                        currentUser = User(name: "Admin User", email: email, role: UserRole.Admin);
                      } else if (email == "employer@example.com" && password == "employerpass") {
                        currentUser = User(name: "Employer User", email: email, role: UserRole.Employer);
                      } else if (email == "employee@example.com" && password == "employeepass") {
                        currentUser = User(name: "Employee User", email: email, role: UserRole.Employee);
                      } else {
                        // Show error message if credentials are incorrect
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid email or password.')),
                        );
                        return;
                      }

                      // Navigate to MainScreen after successful login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen(user: currentUser)),
                      );

                      // Optionally show a login success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Logging in as ${currentUser.role}.')),
                      );
                    }
                  },
                  child: Text('Log In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
