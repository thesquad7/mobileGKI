import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_editphotojemaat.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/home/d_config/base_page.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';

import 'package:flutter/material.dart';

class EditJemaat extends StatefulWidget {
  @override
  JemaatEdit createState() => JemaatEdit();
}

class JemaatEdit extends State<EditJemaat> {
  late TextEditingController? nama,
      tempatlahir,
      tanggallahir,
      _nbapak,
      _nibu,
      _nbabptis,
      _alamat;
  void initState() {
    super.initState();
    nama = TextEditingController();
    tempatlahir = TextEditingController();
    tanggallahir = TextEditingController();
    _alamat = TextEditingController();
    _nbapak = TextEditingController();
    _nibu = TextEditingController();
    _nbabptis = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
            color: dark ? Colors.black54 : Colors.white54,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 100,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Simpan"))),
              Container(
                  width: 100,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Update"))),
              Container(
                  width: 100,
                  child: ElevatedButton(onPressed: () {}, child: Text("Hapus")))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                FilemonPrimaryHeaderCon(
                    height: 200,
                    child: FilemonAppBar(
                      showBackArrow: true,
                      title: Text("Edit"),
                    ),
                    color: Colors.blue),
                EditPhotoJemaat(),
              ],
            ),
            SizedBox(height: 80),
            FTextFieldJemaat(
                nama: nama!,
                tempatlahir: tempatlahir!,
                tanggallahir: tanggallahir!,
                n_bapak: _nbapak!,
                n_ibu: _nibu!,
                n_baptis: _nbabptis!,
                alamat: _alamat!),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
