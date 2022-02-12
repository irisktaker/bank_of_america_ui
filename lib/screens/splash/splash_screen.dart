import 'package:flutter/material.dart';
import '../../widgets/button/splash_btn.dart';
import '../../widgets/background/background_widget.dart';
import 'splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenBloc _splashScreenBloc = SplashScreenBloc();

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
                      onPressed: () =>
                          _splashScreenBloc.gotToLoginScreen(context),
                    ),
                    const SizedBox(height: 20),
                    splashBtn(
                      context,
                      text: "Open an Account",
                      onPressed: () =>
                          _splashScreenBloc.goToOpenAnAccountScreen(context),
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
}
