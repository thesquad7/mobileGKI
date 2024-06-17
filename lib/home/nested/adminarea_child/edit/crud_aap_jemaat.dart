// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/c_editphotojemaat.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/jemaat/jemaatCreateUpdate.dart';
import 'package:MobileGKI/data/crud_state/jemaat/jemaatlisting.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetalisting.dart';
import 'package:MobileGKI/home/d_config/base_page.dart';
import 'package:MobileGKI/provider/adminProvider/JemaatProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

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
  final ValueNotifier<DateTime> tanggallahir =
      ValueNotifier<DateTime>(DateTime.now());
  String formatDateTimeToServer(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    return formatter.format(dateTime);
  }

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  late TextEditingController? nama,
      _num_jemaat,
      tempatlahir,
      _nbapak,
      _nibu,
      _nbabptis,
      _alamat;

  @override
  void initState() {
    super.initState();
    url = "";
    isCreated = true;
    nama = TextEditingController();
    _num_jemaat = TextEditingController();
    tempatlahir = TextEditingController();
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
      _num_jemaat?.value = TextEditingValue(text: infoJemaat.j_id.value);
      nama?.value = TextEditingValue(text: infoJemaat.name.value);
      tempatlahir?.value = TextEditingValue(text: infoJemaat.placeborn.value);
      tanggallahir.value = dateFormat.parse(infoJemaat.dateborn.value);
      _nbapak?.value = TextEditingValue(text: infoJemaat.n_father.value);
      _nibu?.value = TextEditingValue(text: infoJemaat.n_mother.value);
      _nbabptis?.value = TextEditingValue(text: infoJemaat.n_baptis.value);
      _alamat?.value = TextEditingValue(text: infoJemaat.address.value);
    }
    return Scaffold(
      bottomNavigationBar: data
          ? FCRUDNavigationEdit(
              edit: () async {
                String? pic = deviceStorage.read("pic");
                String? Pic2Up;

                FilemonHelperFunctions.showDialogData(
                    "Merubah Data", "Apakah data yang di input telah tepat?",
                    () async {
                  showDialog(
                    context: context,
                    barrierDismissible:
                        false, // Prevent dialog dismissal on tap outside
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(), // Show a loading indicator
                            SizedBox(height: 16),
                            Text('Merubah data...'),
                          ],
                        ),
                      );
                    },
                  );
                  FilemonHelperFunctions.showSnackBar(
                      "Sedang Melakukan Input Data");
                  setState(() {
                    isCreated = false;
                  });
                  if (pic != "null") {
                    Pic2Up = pic;

                    await APIJemaatCRUD(
                            id: infoJemaat.id.value,
                            dateborn:
                                formatDateTimeToServer(tanggallahir.value),
                            baptis: controllerCheck.isChecked.value,
                            pendetaId:
                                controller.selectedItem.value!.id.toString(),
                            n_mother: _nibu!.text.toString(),
                            n_father: _nbapak!.text.toString(),
                            n_babtism: _nbabptis!.text.toString(),
                            placeborn: tempatlahir!.text.toString(),
                            address: _alamat!.text.toString(),
                            name: nama!.text.toString(),
                            file: Pic2Up,
                            jemaatId: infoJemaat.j_id.value)
                        .requestUpdate();
                    log('pic is' + pic!);
                  } else {
                    await APIJemaatCRUD(
                            id: infoJemaat.id.value,
                            dateborn:
                                formatDateTimeToServer(tanggallahir.value),
                            baptis: controllerCheck.isChecked.value,
                            pendetaId:
                                controller.selectedItem.value!.id.toString(),
                            n_mother: _nibu!.text.toString(),
                            n_father: _nbapak!.text.toString(),
                            n_babtism: _nbabptis!.text.toString(),
                            placeborn: tempatlahir!.text.toString(),
                            address: _alamat!.text.toString(),
                            name: nama!.text.toString(),
                            jemaatId: infoJemaat.j_id.value)
                        .requestUpdateSameIMG();
                    log('pic is empty :' + pic!);
                  }

                  if (deviceStorage.read("created") == true) {
                    FilemonHelperFunctions.showSnackBar(
                        deviceStorage.read("message"));
                    deviceStorage.remove("message");
                    deviceStorage.remove("pic");
                    deviceStorage.write("created", false);
                  }
                  Get.close(3);
                  JController.remJemaat();
                  JController.getJemaat();
                });
              },
              delete: () {
                FilemonHelperFunctions.showDialogData(
                  "Menghapus Data",
                  "Apakah anda yakin?",
                  () async {
                    showDialog(
                      context: context,
                      barrierDismissible:
                          false, // Prevent dialog dismissal on tap outside
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(), // Show a loading indicator
                              SizedBox(height: 16),
                              Text('Memproses...'),
                            ],
                          ),
                        );
                      },
                    );
                    FilemonHelperFunctions.showSnackBar("Data sedang dihapus");
                    setState(() {
                      isCreated = false;
                    });
                    await APIJemaatCRUD(
                      id: infoJemaat.id.value,
                    ).requestDelete();
                    if (deviceStorage.read("created") == true) {
                      FilemonHelperFunctions.showSnackBar(
                          deviceStorage.read("message"));
                      deviceStorage.remove("message");
                      deviceStorage.remove("pic");
                      deviceStorage.write("created", false);
                    }
                    Get.close(3);
                    JController.remJemaat();
                    JController.getJemaat();
                  },
                );
              },
            )
          : FCRUDNavigation(
              create: () {
                String? pic = deviceStorage.read("pic");
                FilemonHelperFunctions.showDialogData("Menambahkan Data",
                    "Apakah data yang di input telah tepat?", () async {
                  log(pic.toString());
                  if (pic == null) {
                    FilemonHelperFunctions.showAlertErorr(
                        "Info", "Anda Belum Menambahkan Gambar");
                  } else if (pic == 'Empty') {
                    FilemonHelperFunctions.showAlertErorr(
                        "Info", "Anda Belum Menambahkan Gambar");
                  } else if (pic == '') {
                    FilemonHelperFunctions.showAlertErorr(
                        "Info", "Anda Belum Menambahkan Gambar");
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible:
                          false, // Prevent dialog dismissal on tap outside
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(), // Show a loading indicator
                              SizedBox(height: 16),
                              Text('Memuat data...'),
                            ],
                          ),
                        );
                      },
                    );
                    FilemonHelperFunctions.showSnackBar(
                        "Sedang Melakukan Input Data");
                    setState(() {
                      isCreated = false;
                    });
                    controllerCheck.isChecked.value
                        ? await APIJemaatCRUD(
                            id: infoJemaat.id.value,
                            jemaatId: _num_jemaat!.text.toString(),
                            dateborn:
                                formatDateTimeToServer(tanggallahir.value),
                            baptis: controllerCheck.isChecked.value,
                            pendetaId:
                                controller.selectedItem.value!.id.toString(),
                            n_mother: _nibu!.text.toString(),
                            n_father: _nbapak!.text.toString(),
                            n_babtism: _nbabptis!.text.toString(),
                            placeborn: tempatlahir!.text.toString(),
                            address: _alamat!.text.toString(),
                            name: nama!.text.toString(),
                            file: pic,
                          ).requestCreate()
                        : await APIJemaatCRUD(
                            id: infoJemaat.id.value,
                            jemaatId: _num_jemaat!.text.toString(),
                            dateborn:
                                formatDateTimeToServer(tanggallahir.value),
                            baptis: controllerCheck.isChecked.value,
                            n_mother: _nibu!.text.toString(),
                            n_father: _nbapak!.text.toString(),
                            placeborn: tempatlahir!.text.toString(),
                            address: _alamat!.text.toString(),
                            name: nama!.text.toString(),
                            file: pic,
                          ).requestCreateNobaptis();
                    if (deviceStorage.read("created") == true) {
                      FilemonHelperFunctions.showSnackBar(
                          deviceStorage.read("message"));
                      deviceStorage.remove("message");
                      deviceStorage.remove("pic");
                      deviceStorage.write("created", false);
                    }
                    Get.close(3);
                    JController.remJemaat();
                    JController.getJemaat();
                  }
                });
              },
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
                              controller.items.isNotEmpty &&
                              infoJemaat.pdt_id.value != 0) {
                            controller.setDefaultSelectedItem(
                                infoJemaat.pdt_id.value);
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
                      : const SizedBox(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FTextFieldJemaat(
                  babtis: controllerCheck.isChecked.value,
                  num_jemaat: _num_jemaat!,
                  nama: nama!,
                  tempatlahir: tempatlahir!,
                  tanggal: tanggallahir,
                  n_bapak: _nbapak!,
                  n_ibu: _nibu!,
                  n_baptis: _nbabptis!,
                  alamat: _alamat!),
            ),
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
