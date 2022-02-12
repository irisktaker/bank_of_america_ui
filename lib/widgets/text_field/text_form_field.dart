import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String title;
  String fieldText;
  TextEditingController controller;
  String Function(String?)? validator;
  bool obscureText;
  TextInputType? keyboardType;
  void Function(String) onFieldSubmitted;
  void Function() onTap;

  CustomTextFormField({
    Key? key,
    required this.title,
    required this.fieldText,
    required this.controller,
    required this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.onFieldSubmitted,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: fieldText,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            enabledBorder: underLineBorder(),
            focusedBorder: underLineBorder(),
            disabledBorder: underLineBorder(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

UnderlineInputBorder underLineBorder() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
}
