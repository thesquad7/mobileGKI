// ignore_for_file: unused_import

import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/crud_aama_acara.dart';
import 'package:MobileGKI/home/nested/detailpage/FDetailPage.dart';
import 'package:MobileGKI/provider/adminProvider/acaraProvier.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class APIGetAcaraView {
  APIGetAcaraView({this.acaraId});
  final String? acaraId;
  final dio = Dio();
  final deviceStorage = GetStorage();
  final AcaraProvider infoAcara = Get.put(AcaraProvider());

  var url = "${ConfigBack.apiAdress}/admin/acara/";

  getAcara() async {
    try {
      var response = await DioService().getMethod('$url$acaraId');
      if (response.statusCode == 200) {
        infoAcara.setValue(infoAcara.id, response.data['id'].toString());
        infoAcara.setValue(infoAcara.name, response.data['name'].toString());
        infoAcara.setValue(
            infoAcara.file, response.data['content_img'].toString());
        infoAcara.setValue(
            infoAcara.category_id, response.data['category_id'].toString());
        print(infoAcara.category_id.value);
        infoAcara.setValue(
            infoAcara.content, response.data['content'].toString());
        infoAcara.setValue(
            infoAcara.jam_mulai, response.data['jam_mulai'].toString());
        infoAcara.setValue(
            infoAcara.tanggal, response.data['tanggal'].toString());
        infoAcara.setValue(
            infoAcara.status, response.data['status'].toString());
        infoAcara.setValue(
            infoAcara.location, response.data['location'].toString());
        Get.to(() => EditAcara(
              isNImg: true,
            ));
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.badResponse) {
          FilemonHelperFunctions.showSnackBar(
              "Waktu sesi telah berakhir silahkan Re-Log");
          deviceStorage.write('user_login', false);
          deviceStorage.write('IsFirstTime', false);
          print(deviceStorage.read('user_login'));
          print(deviceStorage.read('IsFirstTime'));
          deviceStorage.remove('usertoken');
          deviceStorage.remove('userC');
          NavigationAdmin().toMain();
        }
      }
    }
  }
}

class APIGetAcaraViewPublic {
  APIGetAcaraViewPublic({this.acaraId});
  final String? acaraId;
  final dio = Dio();
  final deviceStorage = GetStorage();
  final AcaraProvider infoAcara = Get.put(AcaraProvider());

  var url = "${ConfigBack.apiAdress}/p_acara/";

  getAcara() async {
    DateTime tanggalofconvert;
    TimeOfDay timeofconvert;
    try {
      var response = await DioService().getMethod('$url$acaraId');
      if (response.statusCode == 200) {
        infoAcara.setValue(infoAcara.location, response.data['location']);
        infoAcara.setValue(infoAcara.name, response.data['name']);
        infoAcara.setValue(infoAcara.content, response.data['content']);
        timeofconvert =
            FilemonHelperFunctions.parseTimeOfDay(response.data['jam_mulai']);
        tanggalofconvert =
            FilemonHelperFunctions.dateFormat.parse(response.data['tanggal']);
        infoAcara.setValue(infoAcara.tanggal,
            DateFormat.yMMMEd('id_ID').format(tanggalofconvert));
        infoAcara.setValue(infoAcara.jam_mulai,
            FilemonHelperFunctions.formatTimeOfDay(timeofconvert));
        infoAcara.setValue(
            infoAcara.category_name, response.data['category_name']);
        infoAcara.setValue(infoAcara.status, response.data['status']);
        infoAcara.setValue(infoAcara.file, response.data['content_img']);
        Get.to(() => FDetailPageBuilder(
              isAuthor: false,
              content: infoAcara.content.value,
              content_pic: infoAcara.file.value,
              title: infoAcara.name.value,
              category_name: infoAcara.category_name.value,
              jam_detail: infoAcara.jam_mulai.value,
              tanggal_detail: infoAcara.tanggal.value,
              isheadMetadata: false,
              isAddress: true,
              isTime: true,
              isTimeDay: true,
              isCatHMD: false,
              address: infoAcara.location.value,
            ));
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.badResponse) {
          FilemonHelperFunctions.showSnackBar(
              "Waktu sesi telah berakhir silahkan Re-Log");
          deviceStorage.write('user_login', false);
          deviceStorage.write('IsFirstTime', false);
          print(deviceStorage.read('user_login'));
          print(deviceStorage.read('IsFirstTime'));
          deviceStorage.remove('usertoken');
          deviceStorage.remove('userC');
          NavigationAdmin().toMain();
        }
      }
    }
  }
}
