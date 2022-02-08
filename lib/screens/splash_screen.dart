import 'package:flutter/material.dart';
import '/widgets/background_widget.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void gotToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 5, child: Container()),
              Image.asset(
                "assets/images/boa_logo.png",
                fit: BoxFit.cover,
              ),
              Expanded(flex: 2, child: Container()),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    splashBtn(
                      context,
                      text: "Sign in with your account",
                      onPressed: () => gotToLoginScreen(context),
                    ),
                    const SizedBox(height: 20),
                    splashBtn(
                      context,
                      text: "Open an Account",
                      onPressed: () {},
                      fillColor: const Color(0xFF083C6F),
                      txtColor: const Color(0xFFFFFFFF),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 5, child: Container()),
            ],
          ),
        ),
      ),
    );
  }

  Container splashBtn(
    BuildContext context, {
    required String text,
    Color txtColor = const Color(0xFF4DBEE0),
    required void Function()? onPressed,
    Color fillColor = const Color(0xFFFFFFFF),
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: fillColor.withOpacity(0.65),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(child: Container()),
          MaterialButton(
            onPressed: onPressed,
            child: Text(text),
            height: 44,
            textColor: txtColor,
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: txtColor,
            ),
          ),
        ],
      ),
    );
  }
}
