import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FTextFieldJemaat extends StatefulWidget {
  FTextFieldJemaat({
    super.key,
    required this.nama,
    required this.tanggal,
    required this.babtis,
    required this.tempatlahir,
    required this.n_bapak,
    required this.n_ibu,
    required this.n_baptis,
    required this.num_jemaat,
    required this.alamat,
  });
  final ValueNotifier<DateTime> tanggal;
  final TextEditingController nama,
      tempatlahir,
      n_bapak,
      n_ibu,
      num_jemaat,
      n_baptis,
      alamat;
  final bool babtis;
  @override
  State<FTextFieldJemaat> createState() => _FTextFieldJemaat();
}

class _FTextFieldJemaat extends State<FTextFieldJemaat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FTextField(
            controller: widget.num_jemaat,
            title: "Nomor Jemaat",
          ),
          FTextField(
            controller: widget.nama,
            title: "name",
          ),
          FTextField(
            controller: widget.tempatlahir,
            title: "Tempat Lahir",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 120,
                child: Text('Tanggal Lahir'),
              ),
              ValueListenableBuilder<DateTime>(
                valueListenable: widget.tanggal,
                builder: (context, value, child) {
                  return Container(
                    width: 120,
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
                          firstDate: DateTime(1923),
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
          FTextField(
            controller: widget.n_bapak,
            title: "Nama Bapak",
          ),
          FTextField(
            controller: widget.n_ibu,
            title: "Nama Ibu",
          ),
          widget.babtis
              ? FTextField(
                  controller: widget.n_baptis,
                  title: "Nama Baptis",
                )
              : SizedBox(),
          FTextField(
            controller: widget.alamat,
            title: "Alamat",
          ),
        ],
      ),
    );
  }
}
