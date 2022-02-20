import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NameProfileSection extends StatefulWidget {
  const NameProfileSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<NameProfileSection> createState() => _NameProfileSectionState();
}

class _NameProfileSectionState extends State<NameProfileSection> {
  bool shadow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.29,
      width: widget.size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Positioned(
            top: widget.size.height * 0.08,
            child: Container(
              width: widget.size.width - 32,
              height: widget.size.height * 0.19,
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
                        DateFormat("yyyy-MM-dd hh:mm").format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                shadow = !shadow;
              });
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor:
                    const Color(0xFFFFFFFF).withOpacity(shadow ? 0.4 : 0.0),
                radius: 65,
                child: CircleAvatar(
                  backgroundImage: const AssetImage(
                    "assets/images/profile.png",
                  ),
                  radius: shadow ? 55 : 65,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
