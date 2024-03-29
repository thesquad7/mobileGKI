import 'package:flutter/material.dart';

class FTextField extends StatelessWidget {
  const FTextField(
      {super.key,
      required this.title,
      this.passtext = false,
      this.controller,
      this.keyboardType = TextInputType.multiline,
      this.maxLines = 1,
      this.prefix,
      this.suffix});

  final String title;
  final bool passtext;
  final int maxLines;
  final Widget? prefix, suffix;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: passtext,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: OutlineInputBorder(),
          labelText: title,
        ),
      ),
    );
  }
}
