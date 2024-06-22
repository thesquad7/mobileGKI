// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/crud_aama_acara.dart';
import 'package:MobileGKI/home/nested/adminarea_child/jadwal_menu/crud_aaj_jadwal.dart';
import 'package:MobileGKI/provider/adminProvider/acaraProvier.dart';
import 'package:MobileGKI/provider/adminProvider/jadwalProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class APIGetJadwalView {
  APIGetJadwalView({this.acaraId});
  final String? acaraId;
  final dio = Dio();
  final deviceStorage = GetStorage();
  final JadwalProvider infoJadwal = Get.put(JadwalProvider());

  var url = "${ConfigBack.apiAdress}/admin/jadwal/";

  getJadwal() async {
    try {
      var response = await DioService().getMethod('$url$acaraId');
      if (response.statusCode == 200) {
        infoJadwal.setValue(infoJadwal.id, response.data['id'].toString());
        infoJadwal.setValue(infoJadwal.name, response.data['name']);
        infoJadwal.setValue(infoJadwal.file, response.data['content_img']);
        infoJadwal.setValue(infoJadwal.tanggal, response.data['tanggal']);
        infoJadwal.setValue(infoJadwal.jam_mulai, response.data['jam_mulai']);
        infoJadwal.setValue(infoJadwal.content, response.data['content']);
        infoJadwal.setValue(
            infoJadwal.category_id, response.data['category']['id'].toString());
        infoJadwal.setValue(
            infoJadwal.pendeta_id, response.data['pendeta']['id'].toString());
        infoJadwal.setValue(
            infoJadwal.place_id, response.data['church']['id'].toString());
        Get.to(() => EditJadwal(
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
