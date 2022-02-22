import 'package:flutter/material.dart';

class DrawerList {
  String icon;
  String text;
  Color bgColor;
  bool isSelected;
  Widget nav;

  DrawerList({
    required this.icon,
    required this.text,
    required this.bgColor,
    required this.isSelected,
    required this.nav,
  });
}