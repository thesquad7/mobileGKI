import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeAcara extends StatelessWidget {
  const DateTimeAcara({
    super.key,
    required this.tanggal,
    this.jam = "",
    required this.isTimeDay,
  });
  final String tanggal, jam;
  final bool isTimeDay;

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
              Text(
                tanggal,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          SizedBox(width: 30),
          isTimeDay
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.schedule),
                    ),
                    Text(
                      jam,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                )
              : SizedBox()
        ],
      ),
    );
  }
}
