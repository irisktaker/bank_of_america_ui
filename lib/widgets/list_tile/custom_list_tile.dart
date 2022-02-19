// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  String title;
  String subtitle;
  Widget widget;

  CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 6,
      contentPadding: const EdgeInsets.only(
        top: 10,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.pink.shade400,
        radius: 15,
        child: widget,
      ),
      trailing: Text(
        "9:33am 26 sep 17",
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 8,
          color: Colors.grey.shade600,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade600,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
