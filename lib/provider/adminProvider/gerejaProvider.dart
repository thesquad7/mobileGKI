import 'package:get/get.dart';

class GerejaProvider extends GetxController {
  var name = "".obs;
  var file = "".obs;
  var id = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setValue<T>(Rx<T> variable, T value) {
    variable.value = value;
  }
}
