import 'package:flutter/material.dart';

class SettingsListData{
  String icon;
  String title;
  bool isSelected;
  Widget? nav;

  SettingsListData({
    required this.icon,
    required this.title,
    required this.isSelected,
    this.nav,
  });
}