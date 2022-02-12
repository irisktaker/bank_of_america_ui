import 'package:flutter/material.dart';

class CustomMainBtn extends StatelessWidget {
  void Function()? onTap;
  Widget widget;
  double width;
  double height;

  CustomMainBtn({
    required this.onTap,
    required this.widget,
    this.width = double.infinity,
    this.height = 44,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
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
        child: widget,
      ),
    );
  }
}
