import 'dart:developer';

import 'package:MobileGKI/data/api_config.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class APIPendetaCreate {
  APIPendetaCreate(
      {required this.name, required this.status, required this.file});
  final String name, status, file;
  final deviceStorage = GetStorage();
  var url = "${ConfigBack.apiAdress}/admin/pendeta/";
  final dio = Dio();

  requestUpdate() async {
    final formData = FormData.fromMap({
      'name': name,
      'status': status,
      'file': await MultipartFile.fromFile(file)
    });

    try {
      Response response;
      response = await await DioService().postMethod(url, formData);
      if (response.statusCode == 200) {
        log(response.data);
        // String accessToken = response.data['access_token'];
        // String accessTokenString = accessToken.toString();
        // deviceStorage.write("usertoken", accessTokenString);
        // deviceStorage.write('IsFirstTime', false);
        // deviceStorage.write("useradmin", true);
        // var cred = response.data['credential'];
        // String credString = cred.toString();
        // APIGetAdminInfo(userid: credString).get();
        // deviceStorage.write("userC", credString);
        // Future.delayed(const Duration(seconds: 1), () {
        //   FilemonHelperFunctions.showSnackBar("Hi,Kamu Berhasi Masuk");
        //   NavigationAdmin().toMainScreen();
        // });
      } else {}
    } catch (e) {
      if (e is DioException) {
        return FilemonHelperFunctions.showSnackBar("Terjadi Masalah System");
      }
    }
  }
}
