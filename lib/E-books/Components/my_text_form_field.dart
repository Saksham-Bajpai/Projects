import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isNumber;
  final TextEditingController controller;
  const MyTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        // fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        fillColor: Colors.grey[100],
        filled: true,
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          // color: Theme.of(context).colorScheme.primary,
          color: Colors.black,
        ),
      ),
    );
  }
}