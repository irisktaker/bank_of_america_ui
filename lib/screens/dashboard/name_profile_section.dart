import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NameProfileSection extends StatelessWidget {
  const NameProfileSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.27,
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.08,
            child: Container(
              width: size.width - 32,
              height: size.height * 0.17,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  const Text(
                    "Hello John Doe!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3,
                    ),
                  ),
                  Text(
                    "Last login: " +
                        DateFormat("yyyy-MM-dd hh:mm")
                            .format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              backgroundColor:
                  const Color(0xFFFFFFFF).withOpacity(0.4),
              radius: 65,
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/profile.png",
                ),
                radius: 55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
