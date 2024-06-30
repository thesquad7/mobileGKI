// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:developer';

import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/gereja/gerejalisting.dart';
import 'package:MobileGKI/data/crud_state/jadwal/jadwalCreateUpdate.dart';
import 'package:MobileGKI/data/crud_state/jadwal/jadwallisting.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetalisting.dart';
import 'package:MobileGKI/data/model/gereja.dart';
import 'package:MobileGKI/data/model/jadwal.dart';
import 'package:MobileGKI/data/model/pendeta.dart';
import 'package:MobileGKI/home/d_config/jadwal_formfield.dart';
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
  late String url, title, pdt_img;
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

  String formatTimeToServer(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);

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

  late TextEditingController? nama, status, deskripsi;
  late bool isInput;
  @override
  void initState() {
    super.initState();
    url = "";
    pdt_img = "";
    isInput = false;
    isCreated = true;
    nama = TextEditingController();
    status = TextEditingController();
    deskripsi = TextEditingController();
    title = GetStorage().read("pagetitle");
    data = GetStorage().read("data");
    log(widget.isNImg.toString());
    if (widget.isNImg == true) {
      url = infoJadwal.file.value;
      nama?.value = TextEditingValue(text: infoJadwal.name.value);
      tanggal.value = dateFormat.parse(infoJadwal.tanggal.value);
      jam_acara.value = parseTimeOfDay(infoJadwal.jam_mulai.value);
      deskripsi?.value = TextEditingValue(text: infoJadwal.content.value);
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
    final pendetaSize = FilemonHelperFunctions.screenWidthtoPendeta();

    return Scaffold(
      bottomNavigationBar: data
          ? FCRUDNavigationEdit(
              edit: () async {
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
                  if (url != infoJadwal.file.toString()) {
                    log('im here');
                    APIJadwalCRUD(
                            id: infoJadwal.id.value,
                            name: nama!.text,
                            file: url,
                            content: deskripsi!.text,
                            tanggal: formatDateTimeToServer(tanggal.value),
                            jam_acara: formatTimeToServer(jam_acara.value),
                            category_id: type.selectedItem.value!.id,
                            gereja_id: place.selectedItem.value!.id,
                            pendeta_id: controller.selectedItem.value!.id)
                        .requestUpdate();
                  } else {
                    APIJadwalCRUD(
                            id: infoJadwal.id.value,
                            name: nama!.text,
                            content: deskripsi!.text,
                            tanggal: formatDateTimeToServer(tanggal.value),
                            jam_acara: formatTimeToServer(jam_acara.value),
                            category_id: type.selectedItem.value!.id,
                            gereja_id: place.selectedItem.value!.id,
                            pendeta_id: controller.selectedItem.value!.id)
                        .requestUpdateNoImage();
                  }
                  if (deviceStorage.read("created") == true) {
                    FilemonHelperFunctions.showSnackBar(
                        deviceStorage.read("message"));
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
                    await APIJadwalCRUD(
                      id: infoJadwal.id.value,
                    ).requestDelete();
                    if (deviceStorage.read("created") == true) {
                      FilemonHelperFunctions.showSnackBar(
                          deviceStorage.read("message"));
                      deviceStorage.remove("message");
                      deviceStorage.write("created", false);
                    }
                    Get.close(3);
                    JController.remJadwal();
                    JController.getJadwal();
                  },
                );
              },
            )
          : FCRUDNavigation(
              create: () {
                FilemonHelperFunctions.showDialogData("Menambahkan Data",
                    "Apakah data yang di input telah tepat?", () async {
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
                    await APIJadwalCRUD(
                            name: nama!.text,
                            file: url,
                            content: deskripsi!.text,
                            tanggal: formatDateTimeToServer(tanggal.value),
                            jam_acara: formatTimeToServer(jam_acara.value),
                            category_id: type.selectedItem.value!.id,
                            gereja_id: place.selectedItem.value!.id,
                            pendeta_id: controller.selectedItem.value!.id)
                        .requestCreate();
                    if (deviceStorage.read("created") == true) {
                      FilemonHelperFunctions.showSnackBar(
                          deviceStorage.read("message"));
                      deviceStorage.remove("message");
                      deviceStorage.remove("pic");
                      deviceStorage.write("created", false);
                    }
                    Get.close(3);
                    JController.remJadwal();
                    JController.getJadwal();
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
              child: Row(
                children: [
                  Container(
                    child: Stack(children: [
                      RoundedIMG(
                        height: 90,
                        width: 90,
                        isNetworkImage: data ? data : isInput,
                        imageUrl: data
                            ? ConfigBack.apiAdress +
                                ConfigBack.imgInternet +
                                pdt_img
                            : isInput
                                ? ConfigBack.apiAdress +
                                    ConfigBack.imgInternet +
                                    pdt_img
                                : Filemonimages.pendeta1,
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: pendetaSize,
                    child: Obx(() {
                      if (controller.items.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (controller.selectedItem.value == null &&
                          controller.items.isNotEmpty &&
                          data != false) {
                        controller.setDefaultSelectedItem(
                            int.parse(infoJadwal.pendeta_id.value));
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            pdt_img = controller.selectedItem.value!.pic;
                          });
                        });
                      }
                      return DropdownButtonFormField2<PendetaJSONForEntity>(
                        hint: Text('Pengkothbah'),
                        value: controller.selectedItem.value,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (PendetaJSONForEntity? newValue) {
                          controller.setSelectedItem(newValue);
                          setState(() {
                            pdt_img = controller.selectedItem.value!.pic;
                            log(pdt_img);
                          });
                        },
                        items:
                            controller.items.map((PendetaJSONForEntity item) {
                          return DropdownMenuItem<PendetaJSONForEntity>(
                            value: item,
                            child: Text(item.name),
                          );
                        }).toList(),
                      );
                    }),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FJadwalFormField(
                nama: nama!,
                tanggal: tanggal,
                jam: jam_acara,
                status: status!,
                deskripsi: deskripsi!,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Obx(() {
                if (place.items.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                if (place.selectedItem.value == null &&
                    place.items.isNotEmpty &&
                    data != false) {
                  place.setDefaultSelectedItem(
                      int.parse(infoJadwal.category_id.value));
                }
                return DropdownButtonFormField2<GerejaJSONForEntity>(
                  hint: Text('Tempat Ibadah'),
                  value: place.selectedItem.value,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: (GerejaJSONForEntity? newValue) {
                    place.setSelectedItem(newValue);
                  },
                  items: place.items.map((GerejaJSONForEntity item) {
                    return DropdownMenuItem<GerejaJSONForEntity>(
                      value: item,
                      child: Text(item.name),
                    );
                  }).toList(),
                );
              }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Obx(() {
                if (type.items.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                if (type.selectedItem.value == null &&
                    type.items.isNotEmpty &&
                    data != false) {
                  type.setDefaultSelectedItem(
                      int.parse(infoJadwal.category_id.value));
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      colorId = type.selectedItem.value!.color_id;
                    });
                  });
                }
                return DropdownButtonFormField2<JadwalJSONForEntity>(
                  hint: Text('Kategori Jadwal'),
                  value: type.selectedItem.value,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: (JadwalJSONForEntity? newValue) {
                    type.setSelectedItem(newValue);
                    setState(() {
                      colorId = type.selectedItem.value!.color_id;
                    });
                  },
                  items: type.items.map((JadwalJSONForEntity item) {
                    return DropdownMenuItem<JadwalJSONForEntity>(
                      value: item,
                      child: Text(item.name),
                    );
                  }).toList(),
                );
              }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: colorId == null
                        ? null
                        : CategoryColorHandler.categorycolor[colorId!],
                    borderRadius: BorderRadius.circular(
                      10,
                    )),
              ),
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
