import 'package:bank_of_america_ui/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../fingerprint/fingerprint_screen.dart';
import '../login/login_screen.dart';

class SplashScreenBloc {
  // note we need the variable of the secure storage
  final storage = const FlutterSecureStorage();

  Future<void> goToLoginScreen(BuildContext context) async {
    // if fingerprint is checked from the user and the value is YesRecognizeMyFingerPrint
    // so that's mean we saved the values in the secure storage and we will navigate to
    // finger print screen as the requirement is.

    // we need to read the input value from the user we can read it using the value we created
    // in the write method value "fingerPrintRecognitionForNextTime" as a string
    // ------------------------------------------------------  Default value is empty ""
    String goTo = await storage.read(key: "fingerPrintRecognitionForNextTime") ?? "";

    // now the logic condition if
    if (goTo == "YesRecognizeMyFingerPrint") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FingerPrint(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
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
