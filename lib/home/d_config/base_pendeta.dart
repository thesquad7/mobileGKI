import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';

class FTextFieldPendeta extends StatelessWidget {
  const FTextFieldPendeta({
    super.key,
    required this.nama,
    required this.status,
  });
  final TextEditingController nama, status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FTextField(
            controller: nama,
            title: "Nama Pendeta",
          ),
          FTextField(
            controller: status,
            title: "Status",
          ),
        ],
      ),
    );
  }
}
