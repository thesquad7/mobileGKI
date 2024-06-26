// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names

import 'package:MobileGKI/common/widget/c_crud_bottomnavedit.dart';
import 'package:MobileGKI/common/widget/c_horizontal_card.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaraCreateUpdate.dart';
import 'package:MobileGKI/data/crud_state/pengunjung/pengunjungCreateUpdate.dart';
import 'package:MobileGKI/data/crud_state/pengunjung/pengunjunglisting.dart';
import 'package:MobileGKI/home/d_config/pengunjung_formfield.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../provider/adminProvider/pengunjungProvider.dart';
import '../../../../utils/constrains/colors.dart';

class EditPengunjungRUD extends StatefulWidget {
  bool isNImg;
  EditPengunjungRUD({this.isNImg = false});
  @override
  _EditPengunjung createState() => _EditPengunjung();
}

class _EditPengunjung extends State<EditPengunjungRUD> {
  final PengungjungProvider infoPengunjung = Get.put(PengungjungProvider());
  final PengunjungController Acontroller = Get.find();
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
    if (data == true) {
      url = infoPengunjung.j_file.value;
      visit_p =
          TextEditingController(text: infoPengunjung.p_visit.value.toString());
      visit_w =
          TextEditingController(text: infoPengunjung.w_visit.value.toString());
      jemaat_p =
          TextEditingController(text: infoPengunjung.p_jemaat.value.toString());
      jemaat_w =
          TextEditingController(text: infoPengunjung.w_jemaat.value.toString());
      controllerCheck.isChecked(infoPengunjung.stream.value);
      stream = TextEditingController(
          text: infoPengunjung.stream_count.value.toString());
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
      bottomNavigationBar: FCRUDNavigationEdit(
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
            FilemonHelperFunctions.showSnackBar("Sedang Melakukan Input Data");
            setState(() {
              isCreated = false;
            });
            await APIPengunjungCRUD(
              id: infoPengunjung.id.value,
              stream: controllerCheck.isChecked.value,
              w_jemaat: int.parse(jemaat_w!.text),
              p_jemaat: int.parse(jemaat_p!.text),
              w_visit: int.parse(visit_w!.text),
              p_visit: int.parse(visit_p!.text),
              stream_count: int.parse(stream!.text),
            ).requestUpdate();
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
              await APIPengunjungCRUD(
                id: infoPengunjung.id.value,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalCard(
              isnetImgPendeta: true,
              tanggal: infoPengunjung.j_date.value,
              tema: infoPengunjung.j_name.value,
              nama_pendeta: infoPengunjung.j_pendeta.value,
              img_pendeta: ConfigBack.apiAdress +
                  ConfigBack.imgInternet +
                  infoPengunjung.j_file.value,
              jenis_ibadah: infoPengunjung.j_type.value,
              img_bg: ConfigBack.apiAdress +
                  ConfigBack.imgInternet +
                  infoPengunjung.j_bg.value,
              isTempat: true,
              tempat: infoPengunjung.j_place.value,
            ),
            SizedBox(height: 10),
            Padding(
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
