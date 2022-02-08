import 'dart:ui';

import '/screens/dashboard.dart';
import '/widgets/background_widget.dart';
import 'package:flutter/material.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(26),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Text(
                  "Start Using Your Fingerprint",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF083C6F).withOpacity(0.80),
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 26),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashBoardScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/finger_print_2.png",
                  ),
                ),
                Expanded(child: Container()),
                customBtn(
                  context,
                  txt: "Not now",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container customBtn(
    BuildContext context, {
    required String txt,
    required void Function()? onPressed,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF083C6F).withOpacity(0.70),
            const Color(0xFF4DBEE0).withOpacity(0.70),
            const Color(0xFF4DBEE0).withOpacity(0.70),
          ],
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        textColor: Colors.white,
        child: Text(
          txt,
        ),
      ),
    );
  }
}
