import 'dart:convert';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/jemaat/jemaat.dart';
import 'package:dio/dio.dart';

Future<List<JemaatJSON>> fecthJemaat() async {
  final dio = Dio();
  Response response;
  Options options = Options(headers: HeadersCode().data());
  response =
      await dio.get('${ConfigBack.apiAdress}/admin/jemaat/', options: options);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.data);
    print(jsonResponse);
    return jsonResponse.map((data) => JemaatJSON.fromJson(data)).toList();
  } else {
    throw Exception('Data Kosong');
  }
}
