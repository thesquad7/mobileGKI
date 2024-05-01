import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/c_editphotojemaat.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/home/d_config/base_page.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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
    final deviceStorage = GetStorage();
    final data = deviceStorage.read("data");
    return Scaffold(
      bottomNavigationBar: data
          ? FCRUDNavigationEdit(
              edit: () {},
              delete: () {},
            )
          : FCRUDNavigation(
              create: () {},
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
                      title: Text("Edit Jemaat"),
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
