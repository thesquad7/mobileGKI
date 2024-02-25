import 'package:flutter/material.dart';

class PendetaName extends StatelessWidget {
  const PendetaName({
    super.key,
    required this.pendetaname,
  });
  final String pendetaname;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 55,
      left: 100,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow.withOpacity(0.7),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Text(
            pendetaname,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
