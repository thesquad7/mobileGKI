// ignore_for_file: must_be_immutable

import 'dart:ffi';
import 'package:MobileGKI/utils/theme/constrains/c_ltexfield.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class FAcaraFormField extends StatefulWidget {
  FAcaraFormField({
    super.key,
    required this.nama,
    required this.tanggal,
    required this.jam,
    required this.status,
    required this.deskripsi,
    required this.alamat,
  });
  final ValueNotifier<DateTime> tanggal;
  final ValueNotifier<TimeOfDay> jam;
  final TextEditingController nama, deskripsi, status, alamat;
  @override
  State<FAcaraFormField> createState() => _FAcaraFormField();
}

class _FAcaraFormField extends State<FAcaraFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FTextField(
            controller: widget.nama,
            title: "Nama Acara",
          ),
          SizedBox(height: 20),
          LTextField(
            controller: widget.alamat,
            title: "Lokasi",
          ),
          SizedBox(height: 20),
          Text("Tanggal & Waktu"),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  width: 80,
                  child: Text(
                    widget.jam.value.format(context).toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: Text("Pilih"),
                  onPressed: () async {
                    try {
                      TimeOfDay? newtime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (newtime == null) return;
                      setState(() {
                        widget.jam.value = newtime;
                      });
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                ),
              ),
              SizedBox(width: 20),
              ValueListenableBuilder<DateTime>(
                valueListenable: widget.tanggal,
                builder: (context, value, child) {
                  return Container(
                    width: 100,
                    child: Text(DateFormat.yMMMEd('id_ID').format(value)),
                  );
                },
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
          FTextField(
            controller: widget.status,
            title: "Status",
          ),
          SizedBox(height: 20),
          LTextField(
            controller: widget.deskripsi,
            title: "Deskripsi",
          ),
        ],
      ),
    );
  }
}
