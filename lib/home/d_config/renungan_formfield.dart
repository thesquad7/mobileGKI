// ignore_for_file: must_be_immutable

import 'package:MobileGKI/utils/theme/constrains/c_ltexfield.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FRenunganFormField extends StatefulWidget {
  FRenunganFormField({
    super.key,
    required this.nama,
    required this.tanggal,
    required this.deskripsi,
  });
  final ValueNotifier<DateTime> tanggal;

  final TextEditingController nama, deskripsi;
  @override
  State<FRenunganFormField> createState() => _RenunganField();
}

class _RenunganField extends State<FRenunganFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FTextField(
            controller: widget.nama,
            title: "Nama / Tema Renungan",
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),
          Text("Tanggal Rilis"),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 15),
                  ValueListenableBuilder<DateTime>(
                    valueListenable: widget.tanggal,
                    builder: (context, value, child) {
                      return Container(
                        width: 130,
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
            controller: widget.deskripsi,
            title: "Deskripsi",
          ),
        ],
      ),
    );
  }
}
