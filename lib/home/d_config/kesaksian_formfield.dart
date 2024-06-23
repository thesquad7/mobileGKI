// ignore_for_file: must_be_immutable

import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/c_ltexfield.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class FKesaksianFormfield extends StatefulWidget {
  FKesaksianFormfield({
    super.key,
    required this.nama,
    required this.tanggal,
    required this.content,
  });
  final ValueNotifier<DateTime> tanggal;
  final TextEditingController nama, content;
  @override
  State<FKesaksianFormfield> createState() => _FKesaksianFormfield();
}

class _FKesaksianFormfield extends State<FKesaksianFormfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FTextField(
            controller: widget.nama,
            title: "Nama Acara / Tema Acara",
          ),
          SizedBox(height: 20),
          Text("Tanggal & Waktu"),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 10),
                  ValueListenableBuilder<DateTime>(
                    valueListenable: widget.tanggal,
                    builder: (context, value, child) {
                      return Container(
                        width: FilemonHelperFunctions.screenWidth() * 0.5,
                        child: Text(DateFormat.yMMMEd('id_ID').format(value)),
                      );
                    },
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                  child: Text("Pilih"),
                  onPressed: () async {
                    try {
                      DateTime? newtanggal = await showDatePicker(
                          context: context,
                          initialDate: widget.tanggal.value,
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2050));
                      if (newtanggal == null) return;
                      setState(() {
                        widget.tanggal.value = newtanggal;
                        print(widget.tanggal.value);
                      });
                    } catch (e) {}
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          LTextField(
            controller: widget.content,
            title: "Deskripsi",
          ),
        ],
      ),
    );
  }
}
