import 'package:flutter/material.dart';

class AuthController {
  static final AuthController _instance = AuthController._internal();

  factory AuthController() {
    return _instance;
  }

  AuthController._internal();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPassController = TextEditingController();
  void dispose() {
    loginEmailController.dispose();
    loginPassController.dispose();
  }
}
