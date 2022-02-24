import 'package:flutter/material.dart';

AppBar customAppBar({
  Widget? leading,
  required String title,
  required void Function()? onTap,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leadingWidth: 100,
    leading: leading,
    title: Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18,
      ),
    ),
    centerTitle: true,
    actions: [
      MaterialButton(
        onPressed: onTap,
        child: Image.asset(
          "assets/icons/menu.png",
        ),
      ),
    ],
  );
}
