import 'package:flutter/material.dart';

AppBar customAppBar({
  required String title,
}) {
  return AppBar(
    // leading: InkWell(
    //   onTap: () => Drawer(),
    //   child: Image.asset(
    //     "assets/icons/menu.png",
    //   ),
    // ),
    automaticallyImplyLeading: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: [
      InkWell(
        onTap: () {},
        child: Image.asset(
          "assets/icons/menu.png",
        ),
      ),
    ],
  );
}
