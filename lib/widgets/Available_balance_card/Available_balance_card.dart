// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AvailableBalanceCard extends StatelessWidget {
  String balance;
  String currency;
  Widget childe;
  Widget slider;

  AvailableBalanceCard({
    required this.balance,
    this.currency = "\$",
    required this.childe,
    required this.slider,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, left: 16, right: 16),
          padding: const EdgeInsets.all(16),
          width: size.width,
          height: size.height * 0.33,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: size.height * 0.22),
            child: Column(
              children: [
                const Text(
                  "Available Balance",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/location_dot.png",
                      width: 32,
                      height: 32,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "$currency $balance",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.4,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: childe,
            ),
            slider,
          ],
        ),
      ],
    );
  }
}
