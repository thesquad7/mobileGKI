// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, use_key_in_widget_constructors

import 'dart:developer';

import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/data/crud_state/caterogoryGlobalCRUD/CategoryGlobalListing.dart';
import 'package:MobileGKI/data/crud_state/caterogoryGlobalCRUD/CaterogoryCreateUpdate.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetaCreateUpdate.dart';
import 'package:MobileGKI/utils/constrains/colorhandler.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditCategoryPersona extends StatefulWidget {
  @override
  CatPersona createState() => CatPersona();
}

class CatPersona extends State<EditCategoryPersona> {
  late TextEditingController? nama, status;
  late bool isCreated;
  String? _selectedColor;
  int? colorId;
  final CategoryPersonaController categoryController = Get.find();
  String getColorByName(String name) {
    try {
      return CategoryColorHandler.colorName
          .firstWhere((color) => color == name);
    } catch (e) {
      return 'Color not found';
    }
  }

  @override
  void initState() {
    super.initState();
    nama = TextEditingController();
    status = TextEditingController();
    isCreated = true;
    if (GetStorage().read("C_color_id") != null) {
      _selectedColor = CategoryColorHandler
          .colorName[int.parse(GetStorage().read("C_color_id"))];
      colorId = int.parse(GetStorage().read("C_color_id"));
    }
    if (GetStorage().read("data") == true) {
      nama!.value = TextEditingValue(text: GetStorage().read("C_name"));
    }
  }

  @override
  void dispose() {
    GetStorage().remove("C_color_id");
    GetStorage().remove("C_name");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    final title = deviceStorage.read("pagetitle");
    final data = deviceStorage.read("data");

    return Scaffold(
      bottomNavigationBar: data
          ? FCRUDNavigationEdit(edit: () async {
              FilemonHelperFunctions.showDialogData(
                  "Merubah Data", "Apakah data yang di input telah tepat?",
                  () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
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
                log(colorId.toString());
                await APICategoryCRUD(
                  id: int.parse(deviceStorage.read("C_id")),
                  color_id: colorId,
                  name: nama!.text.toString(),
                ).requestUpdatePersonaCategory();
                if (deviceStorage.read("created") == true) {
                  FilemonHelperFunctions.showSnackBar(
                      deviceStorage.read("message"));
                  deviceStorage.remove("message");
                  deviceStorage.remove("pic");
                  deviceStorage.write("created", false);
                }
                Get.close(3);
                categoryController.remCategory();
                categoryController.getCategory();
              });
            }, delete: () {
              FilemonHelperFunctions.showDialogData(
                "Menghapus Data!",
                "Pastikan identitas Pendeta ini tidak terhubung dengan\n\nJemaat, Acara, Kesaksian atau Renungan\n\njika terhubung, anda harus mengatur ulang data pendeta pada info terkait\n\nApakah anda yakin?",
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
                  categoryController.remCategory();
                  categoryController.getCategory();
                },
              );
            })
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
                  FilemonHelperFunctions.showSnackBar(
                      "Sedang Melakukan Input Data");
                  setState(() {
                    isCreated = false;
                  });

                  if (deviceStorage.read("created") == true) {
                    FilemonHelperFunctions.showSnackBar(
                        deviceStorage.read("message"));
                    deviceStorage.remove("message");
                    deviceStorage.remove("pic");
                    deviceStorage.write("created", false);
                  }
                  Get.close(3);
                  categoryController.getCategory();
                  categoryController.remCategory();
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
                    height: 100,
                    child: FilemonAppBar(
                      showBackArrow: true,
                      title: Text(title),
                    ),
                    color: Colors.blue),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SizedBox(
                  height: FilemonHelperFunctions.screenHeight() * 0.8,
                  child: Column(
                    children: [
                      FTextField(
                        title: "Nama Category",
                        controller: nama,
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField2<String>(
                        hint: Text('Warna'),
                        value: _selectedColor,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedColor = value!;
                            colorId =
                                CategoryColorHandler.colorName.indexOf(value);
                          });
                        },
                        items: CategoryColorHandler.colorName
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
                )),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
