import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/c_editphotojemaat.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/home/d_config/base_page.dart';
import 'package:MobileGKI/home/d_config/base_pendeta.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class EditPendeta extends StatefulWidget {
  bool isNImg;
  EditPendeta({this.isNImg = false});
  @override
  PendetaEdit createState() => PendetaEdit();
}

class PendetaEdit extends State<EditPendeta> {
  late TextEditingController? nama, status;
  void initState() {
    super.initState();
    nama = TextEditingController();
    status = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    final title = deviceStorage.read("pagetitle");
    final data = deviceStorage.read("data");
    nama?.value = TextEditingValue(text: deviceStorage.read('P_name'));
    status?.value = TextEditingValue(text: deviceStorage.read('P_status'));
    final _url = deviceStorage.read('P_pic');
    return Scaffold(
      bottomNavigationBar: data ? FCRUDNavigationEdit() : FCRUDNavigation(),
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
                      title: Text(title),
                    ),
                    color: Colors.blue),
                EditPhotoJemaat(
                    isNetImg: widget.isNImg,
                    url: ConfigBack.apiAdress + ConfigBack.imgInternet + _url),
              ],
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: FTextFieldPendeta(nama: nama!, status: status!),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
