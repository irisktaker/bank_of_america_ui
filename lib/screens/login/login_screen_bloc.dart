import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../dashboard/dashboard.dart';
import '../fingerprint/fingerprint_screen.dart';

class LoginScreenBloc {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController bankIDController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Create storage variable
  final storage = const FlutterSecureStorage();

  bool? idCheck = false;
  bool? fingerprintCheck = false;

  Future<void> rememberMyIdForFutureLogin(BuildContext context) async {
    // ID checked if true remember my (id and password) and push to dashboard screen
    // if not don't remember and push to dashboard screen
    if (idCheck == true) {
      // TO_DO: Save ID for future login in SecureStorage
      // Write value
      await storage.write(key: "BRO_ID", value: bankIDController.text);
      await storage.write(key: "Password", value: passwordController.text);
    }

    // If finger print checked so remember my id and password and use finger print to check
    // navigate to finger print screen directly
    if (fingerprintCheck == true) {
      await storage.write(
        key: "fingerPrintRecognitionForNextTime",
        value: "YesRecognizeMyFingerPrint",
      );
    }

    // if yes or not navigate to dashboard screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashBoardScreen(),
      ),
    );
  }

  // Read the value the user added to the field we get it from the controller
  Future<void> getBankIdFromSecureStorage() async {
    bankIDController.text = await storage.read(key: "BRO_ID") ?? "";
    passwordController.text = await storage.read(key: "Password") ?? "";
  }

  // void singWithFingerPrint(BuildContext context) {
  //   fingerprintCheck == true
  //       ? Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const FingerPrint(),
  //           ),
  //         )
  //       : Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const DashBoardScreen(),
  //           ),
  //         );
  // }
}
