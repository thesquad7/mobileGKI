import 'package:get/get.dart';

class KesaksianProvider extends GetxController {
  var id = "".obs;
  var name = "".obs;
  var tanggal = "".obs;
  var content = "".obs;
  var user_id = "".obs;
  var user_name = "".obs;
  var file = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setValue<T>(Rx<T> variable, T value) {
    variable.value = value;
  }
}
