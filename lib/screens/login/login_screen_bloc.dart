import 'package:flutter/material.dart';

import '../dashboard/dashboard.dart';
import '../fingerprint/fingerprint_screen.dart';

class LoginScreenBloc {
  final TextEditingController validateController = TextEditingController();

  final TextEditingController bankIDController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool? idCheck = false;
  bool? fingerprintCheck = false;

  bool _validate = false;
  bool? checkValidate() {
    validateController.text.isEmpty ? _validate = true : _validate = false;
  }

  String bankIdValidate(value) {
    if (value!.isEmpty) {
      return "Please enter your bank ID";
    }
    return '';
  }

  String passwordValidate(value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    if (value.length > 20) {
      return "Password must be less than 20 characters";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain a number";
    }

    return '';
  }

  void singWithFingerPrint(BuildContext context) {
    fingerprintCheck == true
        ? Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FingerPrint(),
            ),
          )
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DashBoardScreen(),
            ),
          );
  }
}
