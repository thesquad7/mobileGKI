import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';

class FTextFieldJemaat extends StatelessWidget {
  const FTextFieldJemaat({
    super.key,
    required this.nama,
    required this.tempatlahir,
    required this.tanggallahir,
    required this.n_bapak,
    required this.n_ibu,
    required this.n_baptis,
    required this.alamat,
  });
  final TextEditingController nama,
      tempatlahir,
      tanggallahir,
      n_bapak,
      n_ibu,
      n_baptis,
      alamat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FTextField(
            controller: nama,
            title: "name",
          ),
          FTextField(
            controller: tempatlahir,
            title: "Tempat Lahir",
          ),
          FTextField(
            controller: tanggallahir,
            title: "TTL",
          ),
          FTextField(
            controller: n_bapak,
            title: "Nama Bapak",
          ),
          FTextField(
            controller: n_ibu,
            title: "Nama Ibu",
          ),
          FTextField(
            controller: n_baptis,
            title: "Nama Baptis",
          ),
          FTextField(
            controller: alamat,
            title: "Alamat",
          ),
        ],
      ),
    );
  }
}
