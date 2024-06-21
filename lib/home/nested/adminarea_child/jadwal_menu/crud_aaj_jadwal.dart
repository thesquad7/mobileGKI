// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:developer';

import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaraCreateUpdate.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/crud_state/gereja/gerejalisting.dart';
import 'package:MobileGKI/data/crud_state/jadwal/jadwallisting.dart';
import 'package:MobileGKI/data/crud_state/jemaat/jemaatCreateUpdate.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetalisting.dart';
import 'package:MobileGKI/data/model/acara.dart';
import 'package:MobileGKI/data/model/pendeta.dart';
import 'package:MobileGKI/home/d_config/acara_formfield.dart';
import 'package:MobileGKI/provider/adminProvider/acaraProvier.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/constrains/colorhandler.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../provider/adminProvider/jadwalProvider.dart';

class EditJadwal extends StatefulWidget {
  bool isNImg;
  EditJadwal({this.isNImg = false});
  @override
  _EditJadwal createState() => _EditJadwal();
}

class _EditJadwal extends State<EditJadwal> {
  final JadwalProvider infoJadwal = Get.put(JadwalProvider());
  final JadwalController JController = Get.find();
  final PendetaEntity controller = Get.put(PendetaEntity());
  final JadwalEntity type = Get.put(JadwalEntity());
  final GerejaEntity place = Get.put(GerejaEntity());
  late String url, title;
  int? colorId;
  late bool isCreated, data;
  final ValueNotifier<DateTime> tanggal =
      ValueNotifier<DateTime>(DateTime.now());
  final ValueNotifier<TimeOfDay> jam_acara =
      ValueNotifier<TimeOfDay>(TimeOfDay.now());
  String formatDateTimeToServer(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  String formatTimeToServer(DateTime dateTime) {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

  XFile? _pickedFile;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  TimeOfDay parseTimeOfDay(String timeString) {
    final format = DateFormat.Hm();
    final DateTime dateTime = format.parse(timeString);
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  late TextEditingController? nama, status, deskripsi, _alamat;
  late bool isInput;
  @override
  void initState() {
    super.initState();
    url = "";
    isInput = false;
    isCreated = true;
    nama = TextEditingController();
    status = TextEditingController();
    _alamat = TextEditingController();
    deskripsi = TextEditingController();
    title = GetStorage().read("pagetitle");
    data = GetStorage().read("data");
    log(widget.isNImg.toString());
    if (widget.isNImg == true) {
      url = infoAcara.file.value;
      nama?.value = TextEditingValue(text: infoAcara.name.value);
      status?.value = TextEditingValue(text: infoAcara.status.value);
      tanggal.value = dateFormat.parse(infoAcara.tanggal.value);
      jam_acara.value = parseTimeOfDay(infoAcara.jam_mulai.value);
      deskripsi?.value = TextEditingValue(text: infoAcara.content.value);
      _alamat?.value = TextEditingValue(text: infoAcara.location.value);
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
                  if (pic == infoAcara.file.toString()) {
                    Pic2Up = pic;
                    // APIAcaraCRUD(
                    //         id: infoAcara.id.value,
                    //         name: nama!.text,
                    //         status: status!.text,
                    //         file: url,
                    //         content: deskripsi!.text,
                    //         location: _alamat!.text,
                    //         tanggal: formatDateTimeToServer(tanggal.value),
                    //         jam_acara: jam_acara.value.hour.toString() +
                    //             ":" +
                    //             jam_acara.value.minute.toString(),
                    //         category_id: controller.selectedItem.value!.id)
                    //     .requestUpdate();
                  } else {
                    // APIAcaraCRUD(
                    //         id: infoAcara.id.value,
                    //         name: nama!.text,
                    //         status: status!.text,
                    //         content: deskripsi!.text,
                    //         location: _alamat!.text,
                    //         tanggal: formatDateTimeToServer(tanggal.value),
                    //         jam_acara: jam_acara.value.hour.toString() +
                    //             ":" +
                    //             jam_acara.value.minute.toString(),
                    //         category_id: controller.selectedItem.value!.id)
                    //     .requestUpdateNoImage();
                  }
                  if (deviceStorage.read("created") == true) {
                    FilemonHelperFunctions.showSnackBar(
                        deviceStorage.read("message"));
                    Get.close(3);
                    JController.remJadwal();
                    JController.getJadwal();
                    deviceStorage.remove("message");
                    deviceStorage.write("created", false);
                  }
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
                    Acontroller.remAcara();
                    Acontroller.getAcara();
                  },
                );
              },
            )
          : FCRUDNavigation(
              create: () {
                FilemonHelperFunctions.showDialogData("Menambahkan Data",
                    "Apakah data yang di input telah tepat?", () async {
                  log(url.toString());
                  if (url == null) {
                    FilemonHelperFunctions.showAlertErorr(
                        "Info", "Anda Belum Menambahkan Gambar");
                  } else if (url == 'Empty') {
                    FilemonHelperFunctions.showAlertErorr(
                        "Info", "Anda Belum Menambahkan Gambar");
                  } else if (url == '') {
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
                    await APIAcaraCRUD(
                            name: nama!.text,
                            status: status!.text,
                            file: url,
                            content: deskripsi!.text,
                            location: _alamat!.text,
                            tanggal: formatDateTimeToServer(tanggal.value),
                            jam_acara: jam_acara.value.hour.toString() +
                                ":" +
                                jam_acara.value.minute.toString(),
                            category_id: controller.selectedItem.value!.id)
                        .requestCreate();
                    if (deviceStorage.read("created") == true) {
                      FilemonHelperFunctions.showSnackBar(
                          deviceStorage.read("message"));
                      deviceStorage.remove("message");
                      deviceStorage.remove("pic");
                      deviceStorage.write("created", false);
                    }
                    Get.close(3);
                    Acontroller.remAcara();
                    Acontroller.getAcara();
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
                FDetailImgView(
                  title: title,
                  isInput: isInput,
                  children: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onPressed: () {
                        _pickedImg();
                      },
                    ),
                  ),
                  imgUrl: widget.isNImg
                      ? ConfigBack.apiAdress + ConfigBack.imgInternet + url
                      : isInput
                          ? url
                          : Filemonimages.pendeta1,
                  netImg: widget.isNImg,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FAcaraFormField(
                nama: nama!,
                tanggal: tanggal,
                alamat: _alamat!,
                jam: jam_acara,
                status: status!,
                deskripsi: deskripsi!,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Obx(() {
                if (controller.items.isEmpty) {
                  return CircularProgressIndicator();
                }
                if (controller.selectedItem.value == null &&
                    controller.items.isNotEmpty &&
                    data != false) {
                  controller.setDefaultSelectedItem(
                      int.parse(infoAcara.category_id.value));
                }
                return DropdownButtonFormField2<AcaraJSONForEntity>(
                  hint: Text('Kategori Acara'),
                  value: controller.selectedItem.value,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: (AcaraJSONForEntity? newValue) {
                    controller.setSelectedItem(newValue);
                  },
                  items: controller.items.map((AcaraJSONForEntity item) {
                    return DropdownMenuItem<AcaraJSONForEntity>(
                      value: item,
                      child: Text(item.name),
                    );
                  }).toList(),
                );
              }),
            ),
            SizedBox(height: 20),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: colorId == null
                      ? null
                      : CategoryColorHandler.categorycolor[colorId!],
                  borderRadius: BorderRadius.circular(
                    10,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future _pickedImg() async {
    final pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _pickedFile = pickedImg != null ? XFile(pickedImg.path) : null;
    if (_pickedFile != null) {
      setState(() {
        widget.isNImg = false;
        isInput = true;
      });
      url = _pickedFile!.path.toString();
    }
  }
}

class CheckboxController extends GetxController {
  var isChecked = false.obs;

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }
}
