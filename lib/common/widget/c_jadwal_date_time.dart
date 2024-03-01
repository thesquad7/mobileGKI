import 'package:flutter/material.dart';

class DateTimeAcara extends StatelessWidget {
  const DateTimeAcara({
    super.key,
    required this.tanggal,
    required this.jam,
  });
  final String tanggal, jam;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.calendar_month),
              ),
              Text(tanggal)
            ],
          ),
          SizedBox(width: 30),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.schedule),
              ),
              Text(jam)
            ],
          )
        ],
      ),
    );
  }
}
