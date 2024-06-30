// ignore_for_file: must_be_immutable

import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';

class FPengungjungFormField extends StatefulWidget {
  FPengungjungFormField({
    super.key,
    required this.jemaat_p,
    required this.visitor_p,
    required this.jemaat_w,
    required this.visitor_w,
  });

  final TextEditingController jemaat_p, jemaat_w, visitor_p, visitor_w;
  @override
  State<FPengungjungFormField> createState() => _FAcaraFormField();
}

class _FAcaraFormField extends State<FPengungjungFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text("Jumlah Jemaat Hadir")),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120,
                child: FTextField(
                  keyboardType: TextInputType.number,
                  controller: widget.jemaat_p,
                  title: "Pria",
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 120,
                child: FTextField(
                  keyboardType: TextInputType.number,
                  controller: widget.jemaat_w,
                  title: "Wanita",
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(child: Text("Jumlah Partisipan Hadir")),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120,
                child: FTextField(
                  keyboardType: TextInputType.number,
                  controller: widget.visitor_p,
                  title: "Pria",
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 120,
                child: FTextField(
                  keyboardType: TextInputType.number,
                  controller: widget.visitor_w,
                  title: "Wanita",
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(child: Text("Live Stream")),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
