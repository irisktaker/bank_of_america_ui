import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class SplashScreenBloc {

  void gotToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}