// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  Widget child;

  BackgroundWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
