import 'package:flutter/material.dart';

GestureDetector splashBtn(
    BuildContext context, {
    required String text,
    Color txtColor = const Color(0xFF4DBEE0),
    required void Function()? onPressed,
    Color fillColor = const Color(0xFFFFFFFF),
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 48,
        decoration: BoxDecoration(
          color: fillColor.withOpacity(0.65),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Expanded(child: Container()),
            Text(
              text,
              style: TextStyle(
                color: txtColor,
                fontSize: 14,
              ),
            ),
            Expanded(child: Container()),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: txtColor,
            ),
          ],
        ),
      ),
    );
  }