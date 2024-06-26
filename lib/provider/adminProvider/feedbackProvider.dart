import 'package:get/get.dart';

class FeebackProvider extends GetxController {
  var name = "".obs;
  var tanggal = "".obs;
  var content = "".obs;
  var file = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setValue<T>(Rx<T> variable, T value) {
    variable.value = value;
  }
}
