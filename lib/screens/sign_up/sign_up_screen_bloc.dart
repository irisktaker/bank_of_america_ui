import 'package:flutter/material.dart';

import '../dashboard/dashboard.dart';
import '../fingerprint/fingerprint_screen.dart';

class SignUpScreenBloc {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController bankIDController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  bool? idCheck = false;
  bool? fingerprintCheck = false;

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