import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: size.width * 0.70,
            height: size.height,
            color: Colors.green,
          ),
          Container(
            width: size.width * 0.30,
            height: size.height,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
