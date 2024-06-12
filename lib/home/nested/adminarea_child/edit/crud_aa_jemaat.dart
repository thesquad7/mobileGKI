// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/c_editphotojemaat.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/jemaat/jemaatlisting.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetalisting.dart';
import 'package:MobileGKI/home/d_config/base_page.dart';
import 'package:MobileGKI/provider/adminProvider/JemaatProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/model/pendeta.dart';

class EditJemaat extends StatefulWidget {
  bool isNImg;
  EditJemaat({this.isNImg = false});
  @override
  JemaatEdit createState() => JemaatEdit();
}

class JemaatEdit extends State<EditJemaat> {
  final JemaatProvider infoJemaat = Get.put(JemaatProvider());
  final PendetaEntity controller = Get.put(PendetaEntity());
  final CheckboxController controllerCheck = Get.put(CheckboxController());
  final JemaatController JController = Get.find();
  late String url;
  late bool isCreated;
  late TextEditingController? nama,
      tempatlahir,
      tanggallahir,
      _nbapak,
      _nibu,
      _nbabptis,
      _alamat;

  @override
  void initState() {
    log(widget.isNImg.toString());
    super.initState();
    url = "";
    isCreated = true;
    nama = TextEditingController();
    tempatlahir = TextEditingController();
    tanggallahir = TextEditingController();
    _alamat = TextEditingController();
    _nbapak = TextEditingController();
    _nibu = TextEditingController();
    _nbabptis = TextEditingController();
    controllerCheck.isChecked(infoJemaat.baptis.value);
  }

  @override
  void dispose() {
    super.dispose();
    GetStorage().remove("data");
  }

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    url = infoJemaat.file.value;
    final title = deviceStorage.read("pagetitle");
    final data = deviceStorage.read("data");
    if (widget.isNImg == true) {
      nama?.value = TextEditingValue(text: infoJemaat.name.value);
      tempatlahir?.value = TextEditingValue(text: infoJemaat.placeborn.value);
      tanggallahir?.value = TextEditingValue(text: infoJemaat.dateborn.value);
      _nbapak?.value = TextEditingValue(text: infoJemaat.n_father.value);
      _nibu?.value = TextEditingValue(text: infoJemaat.n_mother.value);
      _nbabptis?.value = TextEditingValue(text: infoJemaat.n_baptis.value);
      _alamat?.value = TextEditingValue(text: infoJemaat.address.value);
    }
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
                      title: Text(title),
                    ),
                    color: Colors.blue),
                EditPhotoCRUD(
                    isNetImg: widget.isNImg,
                    url: ConfigBack.apiAdress + ConfigBack.imgInternet + url),
              ],
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Checkbox(
                          value: controllerCheck.isChecked.value,
                          onChanged: (bool? value) {
                            setState(() {
                              controllerCheck.toggleCheckbox(value);
                            });
                          },
                        ),
                        Text('Di baptis?'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: FilemonHelperFunctions.screenWidth() * 0.04,
                  ),
                  controllerCheck.isChecked.value
                      ? Obx(() {
                          if (controller.items.isEmpty) {
                            return CircularProgressIndicator();
                          }
                          if (controller.selectedItem.value == null &&
                              controller.items.isNotEmpty) {
                            controller.setDefaultSelectedItem(
                                int.parse(infoJemaat.pdt_id.value));
                          }
                          return DropdownButton<PendetaJSONForEntity>(
                            hint: Text('Pendeta Pembabtis'),
                            value: controller.selectedItem.value,
                            onChanged: (PendetaJSONForEntity? newValue) {
                              controller.setSelectedItem(newValue);
                            },
                            items: controller.items
                                .map((PendetaJSONForEntity item) {
                              return DropdownMenuItem<PendetaJSONForEntity>(
                                value: item,
                                child: Text(item.name),
                              );
                            }).toList(),
                          );
                        })
                      : SizedBox(),
                ],
              ),
            ),
            FTextFieldJemaat(
                nama: nama!,
                tempatlahir: tempatlahir!,
                tanggallahir: tanggallahir!,
                n_bapak: _nbapak!,
                n_ibu: _nibu!,
                n_baptis: _nbabptis!,
                alamat: _alamat!),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class CheckboxController extends GetxController {
  var isChecked = false.obs;

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }
}
