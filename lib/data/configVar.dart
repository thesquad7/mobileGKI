import 'package:get_storage/get_storage.dart';

class ConfigBack {
  ConfigBack._();
  static final apiAdress = "https://b687-180-241-243-139.ngrok-free.app";
  static final imgInternet = "/?path_p=";
}

class HeadersCode {
  final deviceStorage = GetStorage();
  data() {
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer ${deviceStorage.read("usertoken")}',
      'Content-Type': 'application/json',
      // Add more headers if needed
    };
    return headers;
  }
}
