import 'dart:developer';

import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/c_editphotojemaat.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetaCreateUpdate.dart';
import 'package:MobileGKI/home/d_config/base_pendeta.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_pendeta_page.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditPendeta extends StatefulWidget {
  bool isNImg;
  EditPendeta({this.isNImg = false});
  @override
  PendetaEdit createState() => PendetaEdit();
}

class PendetaEdit extends State<EditPendeta> {
  late TextEditingController? nama, status;
  late String url;
  late bool isCreated;

  void initState() {
    log(widget.isNImg.toString());
    super.initState();
    url = "";
    nama = TextEditingController();
    status = TextEditingController();
    isCreated = true;
  }

  @override
  void dispose() {
    super.dispose();
    GetStorage().remove("P_name");
    GetStorage().remove("P_status");
    GetStorage().remove("P_pic");
  }

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    final title = deviceStorage.read("pagetitle");
    final data = deviceStorage.read("data");

    if (widget.isNImg == true) {
      nama?.value = TextEditingValue(text: deviceStorage.read('P_name'));
      status?.value = TextEditingValue(text: deviceStorage.read('P_status'));
      url = deviceStorage.read('P_pic');
    }
    return Scaffold(
      bottomNavigationBar: data
          ? FCRUDNavigationEdit(edit: () async {
              String? pic = deviceStorage.read("pic");
              FilemonHelperFunctions.showDialogData(
                  "Merubah Data", "Apakah data yang di input telah tepat?",
                  () async {
                log(pic.toString());
                if (pic == null || pic == 'Empty') {
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
                      "Sedang Merubah Data,Gambar Tidak Rubah");
                  setState(() {
                    isCreated = false;
                  });
                  await APIPendetaCRUD(
                    pendetaId: deviceStorage.read("pdt_id"),
                    name: nama!.text.toString(),
                    status: status!.text.toString(),
                  ).requestUpdateNoImage();
                  if (deviceStorage.read("created") == true) {
                    FilemonHelperFunctions.showSnackBar(
                        deviceStorage.read("message"));
                    deviceStorage.remove("message");
                    deviceStorage.remove("pic");
                    deviceStorage.write("created", false);
                  }
                  Get.close(3);
                  Future.delayed(const Duration(seconds: 2), () {
                    Get.to(Pendeta());
                  });
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
                  await APIPendetaCRUD(
                          pendetaId: deviceStorage.read("pdt_id"),
                          name: nama!.text.toString(),
                          status: status!.text.toString(),
                          file: pic)
                      .requestUpdate();
                  if (deviceStorage.read("created") == true) {
                    FilemonHelperFunctions.showSnackBar(
                        deviceStorage.read("message"));
                    deviceStorage.remove("message");
                    deviceStorage.remove("pic");
                    deviceStorage.write("created", false);
                  }
                  Get.close(3);
                  Future.delayed(const Duration(seconds: 2), () {
                    Get.to(Pendeta());
                  });
                }
              });
            }, delete: () {
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
                  await APIPendetaCRUD(
                    pendetaId: deviceStorage.read("pdt_id"),
                  ).requestDelete();
                  if (deviceStorage.read("created") == true) {
                    FilemonHelperFunctions.showSnackBar(
                        deviceStorage.read("message"));
                    deviceStorage.remove("message");
                    deviceStorage.remove("pic");
                    deviceStorage.write("created", false);
                  }
                  Get.close(3);
                  Future.delayed(const Duration(seconds: 1), () {
                    Get.to(() => Pendeta());
                  });
                },
              );
            })
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
                    await APIPendetaCRUD(
                            name: nama!.text.toString(),
                            status: status!.text.toString(),
                            file: pic)
                        .requestCreate();
                    if (deviceStorage.read("created") == true) {
                      FilemonHelperFunctions.showSnackBar(
                          deviceStorage.read("message"));
                      deviceStorage.remove("message");
                      deviceStorage.remove("pic");
                      deviceStorage.write("created", false);
                    }
                    Get.close(3);
                    Future.delayed(const Duration(milliseconds: 1), () {
                      Get.to(() => Pendeta());
                    });
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
