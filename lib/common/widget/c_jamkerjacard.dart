import 'package:flutter/material.dart';

class FJadwalCard extends StatelessWidget {
  const FJadwalCard({
    super.key,
    required this.hari,
    required this.jamMulai,
    required this.jamSelesai,
    required this.operasional,
  });
  final String hari, jamMulai, jamSelesai;
  final bool operasional;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: operasional ? Colors.blueAccent : Colors.redAccent,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 60,
                child: Text(hari),
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    child: Text(jamMulai),
                  ),
                  SizedBox(width: 30),
                  Container(
                    width: 40,
                    child: Text(jamSelesai),
                  )
                ],
              )
            ],
          ),
        ),
        elevation: 6,
      ),
    );
  }
}
