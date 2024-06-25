// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/crud_aama_acara.dart';
import 'package:MobileGKI/home/nested/adminarea_child/jadwal_menu/crud_aaj_jadwal.dart';
import 'package:MobileGKI/home/nested/detailpage/FDetailPage.dart';
import 'package:MobileGKI/provider/adminProvider/acaraProvier.dart';
import 'package:MobileGKI/provider/adminProvider/jadwalProvider.dart';
import 'package:MobileGKI/provider/adminProvider/kesaksianProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../home/nested/adminarea_child/kesaksian_menu/crud_aamk_kesaksian.dart';

class APIGetKesaksianInfo {
  APIGetKesaksianInfo({this.acaraId});
  final String? acaraId;
  final dio = Dio();
  final deviceStorage = GetStorage();
  final KesaksianProvider infoKesaksian = Get.put(KesaksianProvider());

  var url = "${ConfigBack.apiAdress}/admin/kesaksian/";

  getJadwal() async {
    try {
      var response = await DioService().getMethod('$url$acaraId');
      if (response.statusCode == 200) {
        infoKesaksian.setValue(
            infoKesaksian.id, response.data['id'].toString());
        infoKesaksian.setValue(
            infoKesaksian.name, response.data['name'].toString());
        infoKesaksian.setValue(
            infoKesaksian.tanggal, response.data['tanggal'].toString());
        infoKesaksian.setValue(
            infoKesaksian.file, response.data['content_img'].toString());
        infoKesaksian.setValue(
            infoKesaksian.content, response.data['content'].toString());
        infoKesaksian.setValue(
            infoKesaksian.user_name, response.data['user']['name'].toString());
        infoKesaksian.setValue(
            infoKesaksian.user_id, response.data['user']['id'].toString());
        Get.to(() => EditKesaksian(
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

class APIGetKesaksianInfoPublic {
  APIGetKesaksianInfoPublic({this.acaraId});
  final String? acaraId;
  final dio = Dio();
  final deviceStorage = GetStorage();
  final KesaksianProvider infoKesaksian = Get.put(KesaksianProvider());

  var url = "${ConfigBack.apiAdress}/p_kesaksian/";

  getJadwal() async {
    DateTime tanggal_converter;
    try {
      var response = await DioService().getMethod('$url$acaraId');
      if (response.statusCode == 200) {
        infoKesaksian.setValue(
            infoKesaksian.name, response.data['name'].toString());
        tanggal_converter =
            FilemonHelperFunctions.dateFormat.parse(response.data['tanggal']);
        infoKesaksian.setValue(infoKesaksian.tanggal,
            DateFormat.yMMMEd('id_ID').format(tanggal_converter));
        infoKesaksian.setValue(
            infoKesaksian.file, response.data['content_img'].toString());
        infoKesaksian.setValue(
            infoKesaksian.content, response.data['content'].toString());
        infoKesaksian.setValue(
            infoKesaksian.user_name, response.data['user']['name'].toString());
        infoKesaksian.setValue(
            infoKesaksian.user_pic, response.data['user']['pic'].toString());
        Get.to(() => FDetailPageBuilder(
              isAuthor: false,
              content: infoKesaksian.content.value,
              content_pic: infoKesaksian.file.value,
              title: infoKesaksian.name.value,
              person_name: infoKesaksian.user_name.value,
              person_status: "Kesaksian",
              person_pic: infoKesaksian.user_pic.value,
              tanggal_detail: infoKesaksian.tanggal.value,
              category_name: "",
              isCatHMD: false,
              isheadMetadata: true,
              isAddress: false,
              isTime: true,
              isTimeDay: false,
              author: '',
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
