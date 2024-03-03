import 'package:MobileGKI/app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const App()));
}
