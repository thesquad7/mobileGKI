import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class LTextField extends StatelessWidget {
  const LTextField({
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
    return Container(
      constraints: BoxConstraints(
        minHeight: 80.0,
        maxHeight: FilemonHelperFunctions.screenHeight() * 4,
      ),
      width: double.infinity,
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
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
