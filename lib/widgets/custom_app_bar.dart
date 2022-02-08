import 'package:flutter/material.dart';

AppBar customAppBar({
  bool automaticallyImplyLeading = true,
  Widget? leading,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: leading,
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Bank Of America",
          style: TextStyle(
            fontFamily: 'Roboto_Condensed',
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 6),
        Image.asset(
          "assets/images/logo.png",
        ),
      ],
    ),
  );
}
