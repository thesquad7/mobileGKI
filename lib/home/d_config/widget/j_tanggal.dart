import 'package:flutter/material.dart';

class Tanggal extends StatelessWidget {
  const Tanggal({
    super.key,
    required this.tanggal,
  });
  final String tanggal;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 8,
        left: 10,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.amber[400]?.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              tanggal,
              style: Theme.of(context).textTheme.bodyMedium,
            )));
  }
}
