import 'package:bank_of_america_ui/screens/sign_up/sign_up_screen.dart';
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

  void goToOpenAnAccountScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }
}