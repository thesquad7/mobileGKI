import 'package:flutter/material.dart';

class FTextField extends StatelessWidget {
  const FTextField({
    super.key,
    required this.title,
    this.passtext = false,
    this.controller,
  });

  final String title;
  final bool passtext;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        obscureText: passtext,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: title,
        ),
      ),
    );
  }
}
