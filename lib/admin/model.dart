import 'package:flutter/material.dart';



enum UserRole { Admin, Employer, Employee }

class User {
  final String name;
  final String email;
  final UserRole role;

  User({required this.name, required this.email, required this.role});
}
