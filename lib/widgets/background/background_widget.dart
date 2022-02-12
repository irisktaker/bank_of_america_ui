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
