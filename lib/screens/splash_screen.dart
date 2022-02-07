import 'package:flutter/material.dart';
import '/widgets/background_widget.dart';


import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      textFormField(
                        text: "Sign in with your account",
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      textFormField(
                        text: "Open an Account",
                        onPressed: () {},
                        fontColor: const Color(0xFFFFFFFF),
                        fillColor: const Color(0xFF083C6F),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 5, child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textFormField({
    required String text,
    Color fontColor = const Color(0xFF4DBEE0),
    required void Function()? onPressed,
    Color fillColor = const Color(0xFFFFFFFF),
  }) {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: text,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        hintStyle: TextStyle(
          color: fontColor,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: fontColor,
          ),
        ),
        filled: true,
        fillColor: fillColor.withOpacity(0.60),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

