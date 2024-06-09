import 'package:get_storage/get_storage.dart';

class ConfigBack {
  ConfigBack._();
  static final apiAdress = "https://f700-180-241-241-172.ngrok-free.app";
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
