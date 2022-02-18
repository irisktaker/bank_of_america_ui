// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../button/custom_main_btn.dart';

class HistoryOfTransactionCard extends StatelessWidget {
  String titleLogo;
  String title;
  String btnTitle;
  Widget child;
  void Function()? onTap;

  HistoryOfTransactionCard({
    required this.titleLogo,
    required this.title,
    required this.btnTitle,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  titleLogo,
                  height: 16,
                  color: Colors.grey.shade900,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: child,
              ),
            ),
            CustomMainBtn(
              onTap: onTap,
              widget: Align(
                alignment: Alignment.center,
                child: Text(
                  btnTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
