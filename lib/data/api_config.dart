import 'dart:developer';

import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/provider/InitialProvider/loginProvider.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:dio/dio.dart' as dioUpers;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class APILogin {
  APILogin({required this.userCred, required this.userCredPw});
  final String userCred, userCredPw;
  final deviceStorage = GetStorage();
  final LoginProvider loginStateProvider = Get.find();
  final dio = dioUpers.Dio();

  requestLogin() async {
    final formData = dioUpers.FormData.fromMap({
      'username': userCred,
      'password': userCredPw,
    });

    try {
      loginStateProvider.setEnableButton(false);
      dioUpers.Response response;
      response = await dio.post('${ConfigBack.apiAdress}/api/v1/token',
          data: formData);
      if (response.statusCode == 200) {
        String accessToken = response.data['access_token'];
        String accessTokenString = accessToken.toString();
        deviceStorage.write("usertoken", accessTokenString);
        deviceStorage.write('IsFirstTime', false);
        deviceStorage.write("useradmin", true);
        var cred = response.data['credential'];
        String credString = cred.toString();
        APIGetAdminInfo(userid: credString).get();
        deviceStorage.write("userC", credString);
        loginStateProvider.setLoadingstate(false);
        loginStateProvider.setEnableButton(false);
        loginStateProvider
            .setInfo("Harap Menunggu, anda akan memasuki halaman utama");
        Future.delayed(const Duration(seconds: 1), () {
          FilemonHelperFunctions.showSnackBar("Hi,Kamu Berhasi Masuk");
          NavigationAdmin().toMainScreen();
        });
      }
    } on dioUpers.DioException catch (e) {
      if (e.response != null) {
        switch (e.response!.statusCode) {
          case 401:
            log(e.toString());
            loginStateProvider.setLoadingstate(false);
            loginStateProvider.setEnableButton(true);
            FilemonHelperFunctions.showSnackBar("Informasi akun salah");
            break;
          case 500:
            log(e.toString());
            loginStateProvider.setLoadingstate(false);
            loginStateProvider.setEnableButton(true);
            FilemonHelperFunctions.showSnackBar(
                "Koneksi bermasalah, harap coba kembali");
            break;
        }
      }
    }
  }
}

class APIGetAdminInfo {
  APIGetAdminInfo({this.userid});
  final String? userid;
  final dio = dioUpers.Dio();
  final deviceStorage = GetStorage();

  get() async {
    try {
      dioUpers.Response response;
      dioUpers.Options options =
          dioUpers.Options(headers: HeadersCode().data());
      response = await dio.get(
          '${ConfigBack.apiAdress}/api/v1/user/{user_id}?api_id=$userid',
          options: options);
      if (response.statusCode == 200) {
        deviceStorage.write("A_name", response.data['name'].toString());
        deviceStorage.write("A_pic", response.data['pic'].toString());
      } else {}
    } catch (e) {
      if (e is dioUpers.DioException) {
        print(e);
        return FilemonHelperFunctions.showSnackBar("Masalah Server Terjadi");
      }
    }
  }
}

class DioService {
  Future<dynamic> getMethod(String url) async {
    dioUpers.Dio dio = dioUpers.Dio();
    dioUpers.Options options =
        dioUpers.Options(headers: HeadersCode().data(), method: "GET");
    return await dio.get(url, options: options).then((response) {
      return response;
    });
  }

  Future<dynamic> postMethod(String url, Object datafile) async {
    dioUpers.Dio dio = dioUpers.Dio();
    dioUpers.Options options =
        dioUpers.Options(headers: HeadersCode().data(), method: "POST");
    return await dio
        .post(url, data: datafile, options: options)
        .then((response) {
      return response;
    });
  }

  Future<dynamic> putMethod(String url, Object datafile) async {
    dioUpers.Dio dio = dioUpers.Dio();
    dioUpers.Options options =
        dioUpers.Options(headers: HeadersCode().data(), method: "PUT");
    return await dio
        .put(url, data: datafile, options: options)
        .then((response) {
      return response;
    });
  }

  Future<dynamic> deleteMethod(String url) async {
    dioUpers.Dio dio = dioUpers.Dio();
    dioUpers.Options options =
        dioUpers.Options(headers: HeadersCode().data(), method: "DELETE");
    return await dio.delete(url, options: options).then((response) {
      return response;
    });
  }
}
