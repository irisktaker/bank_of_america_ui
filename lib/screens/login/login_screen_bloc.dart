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

  // String savedBankId = "";

  bool? idCheck = false;
  bool? fingerprintCheck = false;

  Future<void> rememberMyIdForFutureLogin(BuildContext context) async {
    if (idCheck == true) {

      // TO_DO: Save ID for future login in SecureStorage
      // Write value
      await storage.write(key: "BRO_ID", value: bankIDController.text);
      await storage.write(key: "Password", value: passwordController.text);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashBoardScreen(),
      ),
    );
  }

  // Read value
  void getBankIdFromSecureStorage() async {
    await storage.read(key: "BRO_ID");
    await storage.read(key: "Password");
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
