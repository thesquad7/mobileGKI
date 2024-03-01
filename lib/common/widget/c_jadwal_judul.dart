import 'package:flutter/material.dart';

class JudulJadwal extends StatelessWidget {
  const JudulJadwal({
    super.key,
    required this.judul,
  });
  final String judul;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        judul,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
