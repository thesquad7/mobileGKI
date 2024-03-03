import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class FTextField extends StatelessWidget {
  const FTextField({
    super.key,
    required this.title,
    this.passtext = false,
    this.controller,
    this.keyboardType = TextInputType.multiline,
    this.maxLines = 1,
  });

  final String title;
  final bool passtext;
  final int maxLines;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return SizedBox(
      width: double.infinity,
      child: TextField(
        keyboardType: keyboardType,
        maxLines: maxLines,
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
