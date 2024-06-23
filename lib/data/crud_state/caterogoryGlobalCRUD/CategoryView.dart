import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_aap_category.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class APIGetCategoryInfo {
  APIGetCategoryInfo({this.categoryId});
  final String? categoryId;
  final dio = Dio();
  final deviceStorage = GetStorage();

  var url = "${ConfigBack.apiAdress}/admin/category/";

  getCategory() async {
    try {
      var response = await DioService().getMethod('$url$categoryId');
      if (response.statusCode == 200) {
        deviceStorage.write("C_name", response.data['name'].toString());
        deviceStorage.write("C_id", response.data['id'].toString());
        deviceStorage.write("C_color_id", response.data['color_id'].toString());
        Get.to(() => EditCategoryPersona());
      }
    } catch (e) {
      if (e is DioException) {
        switch (e.response!.statusCode) {
          case 401:
            FilemonHelperFunctions.showSnackBar(
                "Waktu sesi telah berakhir silahkan Re-Log");
            deviceStorage.write('user_login', false);
            deviceStorage.write('IsFirstTime', false);
            print(deviceStorage.read('user_login'));
            print(deviceStorage.read('IsFirstTime'));
            deviceStorage.remove('usertoken');
            deviceStorage.remove('userC');
            NavigationAdmin().toMain();
            break;
          case 500:
            FilemonHelperFunctions.showSnackBar(
                "Koneksi bermasalah, ini bukan pada perangkat anda");
            break;
        }
      }
    }
  }
}
