import 'package:get/get.dart';

class LoginProvider extends GetxController {
  var enableButton = true.obs;
  var loadingState = false.obs;
  var info = ''.obs;
  void setEnableButton(bool value) {
    enableButton.value = value;
  }

  void setLoadingstate(bool value) {
    loadingState.value = value;
  }

  void setInfo(String value) {
    info.value = value;
  }

  void toggleEnableButton() {
    enableButton.value = !enableButton.value;
  }

  void toggleinfo() {
    enableButton.value = !enableButton.value;
  }

  void toggleLoadingState() {
    loadingState.value = !loadingState.value;
  }
}
