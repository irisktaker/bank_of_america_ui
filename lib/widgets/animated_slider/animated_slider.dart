import 'package:flutter/material.dart';

AnimatedContainer slider(
  paymentCard,
  pagePosition,
  active, {
  required String image,
  required String cardType,
  required String cardNumber,
  required String exDate,
}) {
  double margin = active ? 5 : 20;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(30),
    //   image: DecorationImage(
    //     image: NetworkImage(images[pagePosition]),
    //     fit: BoxFit.cover,
    //   ),
    // ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade300,
        image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.fitWidth),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                cardType,
                width: 44,
                height: 40,
              ),
            ),
            const Spacer(flex: 2),
            Text(
              cardNumber,
              style: TextStyle(
                letterSpacing: 1.2,
                fontSize: 18,
                color: Colors.grey.shade800,
              ),
            ),
            const Spacer(flex: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                exDate,
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 16,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    ),
  );
}
