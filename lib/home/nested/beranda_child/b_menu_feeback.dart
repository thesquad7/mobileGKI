// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/data/crud_state/feedback/feedbackCreateUpdate.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/c_ltexfield.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class BerandaFeedback extends StatefulWidget {
  const BerandaFeedback({super.key});

  @override
  State<BerandaFeedback> createState() => _BerandaFeedbackState();
}

class _BerandaFeedbackState extends State<BerandaFeedback> {
  late final desc = TextEditingController();
  late final author = TextEditingController();
  late bool isInput;
  late String url;
  XFile? _pickedFile;
  @override
  void initState() {
    isInput = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            FDetailImgView(
              title: "Kritik & Saran",
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
              imgUrl: isInput ? url : Filemonimages.placeholder,
              isInput: isInput,
              netImg: false,
            ),
          ]),
          SizedBox(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FTextField(controller: author, title: "Pengirim"),
          )),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: LTextField(controller: desc, title: "Masukan"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SizedBox(
                height: 50,
                width: FilemonHelperFunctions.screenWidth(),
                child: ElevatedButton(
                    onPressed: () async {
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
                          await APIFeebackCreated(
                                  name: author.text,
                                  file: url,
                                  content: desc.text)
                              .requestCreate();
                          if (deviceStorage.read("created") == true) {
                            FilemonHelperFunctions.showSnackBar(
                                deviceStorage.read("message"));
                            deviceStorage.remove("message");
                            deviceStorage.remove("pic");
                            deviceStorage.write("created", false);
                          }
                          Get.close(3);
                        }
                      });
                    },
                    child: Text("Kirim"))),
          )
        ]),
      ),
    );
  }

  Future _pickedImg() async {
    final pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _pickedFile = pickedImg != null ? XFile(pickedImg.path) : null;
    if (_pickedFile != null) {
      setState(() {
        isInput = true;
      });
      url = _pickedFile!.path.toString();
    }
  }
}
