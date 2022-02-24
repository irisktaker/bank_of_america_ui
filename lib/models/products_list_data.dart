import 'package:flutter/material.dart';

class ProductsListData{
  String icon;
  String title;
  bool isSelected;
  Widget? nav;

  ProductsListData({
    required this.icon,
    required this.title,
    required this.isSelected,
    this.nav,
  });
}