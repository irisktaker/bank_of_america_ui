import 'package:flutter/material.dart';

class LoginScreenBloc {
  final TextEditingController bankIDController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool? idCheck = false;
  bool? fingerprintCheck = false;

  String bankIdValidate(value) {
    value!.isEmpty ? "Please enter your bank ID" : null;
    return value;
  }

  String passwordValidate(value) {
    value!.isEmpty ? "Please enter your password" : null;
    return value;
  }
}
