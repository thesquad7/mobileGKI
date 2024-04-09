import 'dart:developer';
import 'dart:io';

import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

enum AppState { free, picked, cropped }

class EditPhotoJemaat extends StatefulWidget {
  const EditPhotoJemaat({
    super.key,
  });

  @override
  State<EditPhotoJemaat> createState() => _EditPhotoJemaatState();
}

class _EditPhotoJemaatState extends State<EditPhotoJemaat> {
  late AppState state;
  XFile? _pickedFile;
  CroppedFile? _croppedFile;
  late bool contiditon;

  void initState() {
    super.initState();
    contiditon = false;
    state = AppState.free;
  }

  void dispose() {
    super.dispose();
    contiditon = false;
  }

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
              isFile: contiditon,
              imageUrl: _croppedFile != null
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
          state = AppState.cropped;
          _croppedFile = croppedFile;
          contiditon = true;
        });
      }
    }
  }

  void _clear() {
    setState(() {
      state = AppState.free;
      _pickedFile = null;
      _croppedFile = null;
      contiditon = false;
    });
  }
}
