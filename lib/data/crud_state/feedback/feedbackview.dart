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
import 'package:MobileGKI/provider/adminProvider/feedbackProvider.dart';
import 'package:MobileGKI/provider/adminProvider/jadwalProvider.dart';
import 'package:MobileGKI/provider/adminProvider/kesaksianProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../home/nested/adminarea_child/kesaksian_menu/crud_aamk_kesaksian.dart';

class APIGetFeedbackFView {
  APIGetFeedbackFView({this.acaraId});
  final String? acaraId;
  final dio = Dio();
  final deviceStorage = GetStorage();
  final FeebackProvider infoFeedback = Get.put(FeebackProvider());

  var url = "${ConfigBack.apiAdress}/admin/address/";

  getJadwal() async {
    try {
      var response = await DioService().getMethod('$url$acaraId');
      if (response.statusCode == 200) {
        infoFeedback.setValue(infoFeedback.name, response.data['name']);
        infoFeedback.setValue(infoFeedback.content, response.data['content']);
        infoFeedback.setValue(infoFeedback.file, response.data['content_img']);
        DateTime timeconverter = DateTime.parse(response.data['created_at']);
        String timeview = DateFormat.yMMMEd('id_ID').format(timeconverter);
        infoFeedback.setValue(infoFeedback.tanggal, timeview);
        Get.to(() => FDetailPageBuilder(
            title_page: "Saran / Kritik",
            content: infoFeedback.content.value,
            content_pic: infoFeedback.file.value,
            title: "Dari : " + infoFeedback.name.value,
            tanggal_detail: infoFeedback.tanggal.value,
            isheadMetadata: false,
            isAddress: false,
            isTime: true,
            isTimeDay: false,
            isCatHMD: false,
            isAuthor: false));
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
