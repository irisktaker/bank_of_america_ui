import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  String txt;
  bool? value;
  void Function(bool?)? onChanged;

  CustomCheckBox({
    Key? key,
    required this.txt,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 6,
            child: Transform.scale(
              scale: 0.8,
              child: Checkbox(
                checkColor: const Color.fromARGB(255, 91, 166, 228),
                fillColor: MaterialStateProperty.all(Colors.white),
                value: value,
                onChanged: onChanged,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          txt,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
