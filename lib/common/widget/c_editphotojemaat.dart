import 'dart:developer';
import 'dart:io';

import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_pendeta.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

enum AppState { free, picked, cropped }

class EditPhotoCRUD extends StatefulWidget {
  late bool isNetImg;
  final String url;

  EditPhotoCRUD({
    super.key,
    this.isNetImg = false,
    this.url = "",
  });

  @override
  State<EditPhotoCRUD> createState() => _EditPhotoCRUD();
}

class _EditPhotoCRUD extends State<EditPhotoCRUD> {
  late AppState state;
  XFile? _pickedFile;
  CroppedFile? _croppedFile;
  late bool contiditon;

  void initState() {
    super.initState();
    GetStorage.init();
    contiditon = false;
    state = AppState.free;
    GetStorage().writeIfNull("pic", "Empty");
  }

  String get croppedFileName => _croppedFile!.path.toString();

  void dispose() {
    contiditon = false;
    widget.isNetImg = true;
    GetStorage().writeIfNull("pic", "");
    if (Get.currentRoute != '/EditPendeta') {
      // Delete the variable from GetStorage cache
      GetStorage().remove('pic');
    }
    super.dispose();
  }

  final data = GetStorage().read("data");
  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);

    return Positioned(
      top: 150,
      child: SizedBox(
        height: 120,
        child: Stack(children: [
          RoundedIMG(
              height: 100,
              isNetworkImage: widget.isNetImg,
              isFile: contiditon,
              imageUrl: widget.isNetImg
                  ? widget.url
                  : _croppedFile != null
                      ? _croppedFile!.path
                      : _pickedFile != null
                          ? _pickedFile!.path
                          : Filemonimages.pendeta1),
          Positioned(
            top: 2,
            left: 2,
            child: InkWell(
              onTap: () {
                if (state == AppState.free) {
                  _pickedImg();
                } else if (state == AppState.picked) {
                  _cropImage();
                  log(GetStorage().read("pic"));
                } else if (state == AppState.cropped) {
                  _clear();
                }
              },
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: dark
                          ? Colors.white.withOpacity(0.5)
                          : Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    _icons(),
                    color: dark ? Colors.black : Colors.white,
                    size: 25,
                  )),
            ),
          )
        ]),
      ),
    );
  }

  IconData _icons() {
    if (state == AppState.free) {
      return Icons.add;
    } else if (state == AppState.picked) {
      return Icons.crop;
    } else {
      return Icons.delete;
    }
  }

  Future _pickedImg() async {
    final pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _pickedFile = pickedImg != null ? XFile(pickedImg.path) : null;
    if (_pickedFile != null) {
      setState(() {
        GetStorage().write("pic", _pickedFile!.path.toString());
        widget.isNetImg = false;
        state = AppState.picked;
        contiditon = true;
      });
    }
  }

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Pangkas Gambar',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          GetStorage().write("pic", "");
          state = AppState.cropped;
          _croppedFile = croppedFile;
          contiditon = true;
          GetStorage().write("pic", _croppedFile!.path.toString());
          log(GetStorage().read("pic"));
        });
      }
    }
  }

  void _clear() {
    data
        ? setState(() {
            state = AppState.free;
            widget.isNetImg = true;
            _pickedFile = null;
            _croppedFile = null;
            contiditon = false;
            GetStorage().remove("pic");
          })
        : setState(() {
            state = AppState.free;
            widget.isNetImg = false;
            _pickedFile = null;
            _croppedFile = null;
            contiditon = false;
            GetStorage().remove("pic");
          });
  }
}
