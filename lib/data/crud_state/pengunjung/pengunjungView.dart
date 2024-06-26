import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/home/nested/adminarea_child/pengunjung/rud_aamp_pengunjung.dart';
import 'package:MobileGKI/provider/adminProvider/pengunjungProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class APIGetPengunjungInfo {
  APIGetPengunjungInfo({this.pendetaId});
  final PengungjungProvider infoPengunjung = Get.put(PengungjungProvider());
  final String? pendetaId;
  final dio = Dio();
  final deviceStorage = GetStorage();

  var url = "${ConfigBack.apiAdress}/admin/visitor/";

  getPendeta() async {
    try {
      var response = await DioService().getMethod('$url$pendetaId');
      if (response.statusCode == 200) {
        infoPengunjung.setValue(infoPengunjung.id, response.data['id']);
        infoPengunjung.setValue(
            infoPengunjung.w_jemaat, response.data['w_jemaat']);
        infoPengunjung.setValue(
            infoPengunjung.p_jemaat, response.data['p_jemaat']);
        infoPengunjung.setValue(
            infoPengunjung.w_visit, response.data['w_visit']);
        infoPengunjung.setValue(
            infoPengunjung.p_visit, response.data['p_visit']);
        infoPengunjung.setValue(
            infoPengunjung.stream_count, response.data['stream_count']);
        infoPengunjung.setValue(infoPengunjung.stream, response.data['stream']);
        infoPengunjung.setValue(
            infoPengunjung.j_name, response.data['jadwal']['name']);
        DateTime timeconver = FilemonHelperFunctions.dateFormat
            .parse(response.data['jadwal']['date']);
        infoPengunjung.setValue(infoPengunjung.j_date,
            DateFormat.yMMMEd('id_ID').format(timeconver));
        infoPengunjung.setValue(
            infoPengunjung.j_type, response.data['jadwal']['jenis']);
        infoPengunjung.setValue(
            infoPengunjung.j_pendeta, response.data['jadwal']['pendeta']);
        infoPengunjung.setValue(
            infoPengunjung.j_file, response.data['jadwal']['p_pic']);
        infoPengunjung.setValue(
            infoPengunjung.j_bg, response.data['jadwal']['file']);
        infoPengunjung.setValue(
            infoPengunjung.j_place, response.data['jadwal']['place']);
        Get.to(() => EditPengunjungRUD());
      }
    } catch (e) {
      if (e is DioException) {
        print(e);
        return FilemonHelperFunctions.showSnackBar("Masalah Server Terjadi");
      }
    }
  }
}

class APIGetPengunjungInfoPublic {
  APIGetPengunjungInfoPublic({this.pendetaId});
  final String? pendetaId;
  final dio = Dio();
  final deviceStorage = GetStorage();

  var url = "${ConfigBack.apiAdress}/admin/pendeta/";

  getPendeta() async {
    try {
      var response = await DioService().getMethod('$url$pendetaId');
      if (response.statusCode == 200) {
        deviceStorage.write("P_name", response.data['name'].toString());
        deviceStorage.write("P_pic", response.data['profile_img'].toString());
        deviceStorage.write("P_status", response.data['status'].toString());
      }
    } catch (e) {
      if (e is DioException) {
        print(e);
        return FilemonHelperFunctions.showSnackBar("Masalah Server Terjadi");
      }
    }
  }
}
