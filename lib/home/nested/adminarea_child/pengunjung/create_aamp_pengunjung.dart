// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names

import 'dart:developer';

import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/c_horizontal_card.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaraCreateUpdate.dart';
import 'package:MobileGKI/data/crud_state/pengunjung/pengunjungCreateUpdate.dart';
import 'package:MobileGKI/data/crud_state/pengunjung/pengunjunglisting.dart';
import 'package:MobileGKI/data/model/pengunjung.dart';
import 'package:MobileGKI/home/d_config/pengunjung_formfield.dart';
import 'package:MobileGKI/provider/adminProvider/acaraProvier.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constrains/colors.dart';

class EditPengunjung extends StatefulWidget {
  bool isNImg;
  EditPengunjung({this.isNImg = false});
  @override
  _EditPengunjung createState() => _EditPengunjung();
}

class _EditPengunjung extends State<EditPengunjung> {
  final AcaraProvider infoAcara = Get.put(AcaraProvider());
  final PengunjungController Acontroller = Get.find();
  final PengunjungEntity controller = Get.put(PengunjungEntity());
  final CheckboxController controllerCheck = Get.put(CheckboxController());
  late String url, title;
  int? colorId;
  late bool isCreated, data;

  late TextEditingController? visit_p, visit_w, jemaat_p, jemaat_w, stream;
  late bool isInput;
  @override
  void initState() {
    super.initState();
    url = "";
    isInput = false;
    isCreated = true;
    controllerCheck.isChecked(true);
    visit_p = TextEditingController(text: "0");
    visit_w = TextEditingController(text: "0");
    jemaat_p = TextEditingController(text: "0");
    jemaat_w = TextEditingController(text: "0");
    stream = TextEditingController(text: "0");
    title = GetStorage().read("pagetitle");
    data = GetStorage().read("data");
    if (widget.isNImg == true) {
      url = infoAcara.file.value;
      // nama?.value = TextEditingValue(text: infoAcara.name.value);
      // status?.value = TextEditingValue(text: infoAcara.status.value);
      // tanggal.value = dateFormat.parse(infoAcara.tanggal.value);
      // jam_acara.value = parseTimeOfDay(infoAcara.jam_mulai.value);
      // deskripsi?.value = TextEditingValue(text: infoAcara.content.value);
      // _alamat?.value = TextEditingValue(text: infoAcara.location.value);
    }
  }

  @override
  void dispose() {
    super.dispose();
    GetStorage().remove("data");
  }

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    final dark = FilemonHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: dark
                    ? FilemonColor.white.withOpacity(0.3)
                    : FilemonColor.dark.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: dark ? Colors.black : Colors.white,
                )),
          ),
        ),
        title: Text(deviceStorage.read("pagetitle")),
      ),
      bottomNavigationBar: data
          ? FCRUDNavigationEdit(
              edit: () async {
                String? pic = deviceStorage.read("pic");
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
                  if (pic == infoAcara.file.toString()) {}
                  if (deviceStorage.read("created") == true) {
                    FilemonHelperFunctions.showSnackBar(
                        deviceStorage.read("message"));
                  }
                  Get.close(3);
                  Acontroller.remData();
                  Acontroller.getData();
                  deviceStorage.remove("message");
                  deviceStorage.write("created", false);
                });
              },
              delete: () {
                FilemonHelperFunctions.showDialogData(
                  "Menghapus Data",
                  "Apakah anda yakin, untuk menghapus acara ini?",
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
                    await APIAcaraCRUD(
                      id: infoAcara.id.value,
                    ).requestDelete();
                    if (deviceStorage.read("created") == true) {
                      FilemonHelperFunctions.showSnackBar(
                          deviceStorage.read("message"));
                      deviceStorage.remove("message");
                      deviceStorage.write("created", false);
                    }
                    Get.close(3);
                    Acontroller.remData();
                    Acontroller.getData();
                  },
                );
              },
            )
          : FCRUDNavigation(
              create: () {
                FilemonHelperFunctions.showDialogData("Menambahkan Data",
                    "Apakah data yang di input telah tepat?", () async {
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
                  log("im here1");
                  await APIPengunjungCRUD(
                          stream: controllerCheck.isChecked.value,
                          w_jemaat: int.parse(jemaat_w!.text),
                          p_jemaat: int.parse(jemaat_p!.text),
                          w_visit: int.parse(visit_w!.text),
                          p_visit: int.parse(visit_p!.text),
                          stream_count: int.parse(stream!.text),
                          jadwal_id: controller.selectedItem.value!.id)
                      .requestCreate();
                  FilemonHelperFunctions.showSnackBar(
                      "Sedang Melakukan Input Data");
                  log("im here2");
                  setState(() {
                    isCreated = false;
                  });

                  if (deviceStorage.read("created") == true) {
                    FilemonHelperFunctions.showSnackBar(
                        deviceStorage.read("message"));
                    deviceStorage.remove("message");
                    deviceStorage.remove("pic");
                    deviceStorage.write("created", false);
                    Get.close(3);
                    Acontroller.remData();
                    Acontroller.getData();
                  }
                });
              },
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Obx(() {
                if (controller.items.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.selectedItem.value == null &&
                    controller.items.isNotEmpty &&
                    data != false) {
                  controller.setDefaultSelectedItem(
                      int.parse(infoAcara.category_id.value));
                }
                return DropdownButtonFormField2<PengunjungJSONForEntity>(
                  hint: Text('Pilih Jadwal'),
                  value: controller.selectedItem.value,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: (PengunjungJSONForEntity? newValue) {
                    controller.setSelectedItem(newValue);
                    setState(() {
                      isInput = true;
                    });
                  },
                  items: controller.items.map((PengunjungJSONForEntity item) {
                    return DropdownMenuItem<PengunjungJSONForEntity>(
                      value: item,
                      child: Text(item.name),
                    );
                  }).toList(),
                );
              }),
            ),
            SizedBox(height: 20),
            isInput
                ? HorizontalCard(
                    isnetImgPendeta: true,
                    tanggal: controller.selectedItem.value!.tanggal,
                    tema: controller.selectedItem.value!.name,
                    nama_pendeta: controller.selectedItem.value!.pendeta,
                    img_pendeta: ConfigBack.apiAdress +
                        ConfigBack.imgInternet +
                        controller.selectedItem.value!.pendeta_pic,
                    jenis_ibadah: controller.selectedItem.value!.category_name,
                    img_bg: ConfigBack.apiAdress +
                        ConfigBack.imgInternet +
                        controller.selectedItem.value!.pic,
                    isTempat: true,
                    tempat: controller.selectedItem.value!.place,
                  )
                : SizedBox(),
            SizedBox(height: 10),
            isInput
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        FPengungjungFormField(
                            jemaat_p: jemaat_p!,
                            visitor_p: visit_p!,
                            jemaat_w: jemaat_w!,
                            visitor_w: visit_w!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: controllerCheck.isChecked.value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      controllerCheck.toggleCheckbox(value);
                                    });
                                  },
                                ),
                                Text('Ditayangkan?'),
                              ],
                            ),
                            controllerCheck.isChecked.value
                                ? Container(
                                    width: 120,
                                    child: FTextField(
                                        controller: stream, title: "Jumlah"),
                                  )
                                : SizedBox()
                          ],
                        )
                      ],
                    ),
                  )
                : SizedBox()
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
