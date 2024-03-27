import 'package:MobileGKI/home/navigation_ui/nav_menuadmin.dart';
import 'package:MobileGKI/home/navigation_ui/nav_menuvisitor.dart';
import 'package:MobileGKI/init/adminloginscreen.dart';
import 'package:MobileGKI/init/onboardingscreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepos extends GetxController {
  static AuthRepos get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    //Local
    if (deviceStorage.read('IsFirstTime') == true) {
      return Get.offAll(() => OnboardingScreen());
    } else {
      if (deviceStorage.read('useradmin') == false) {
        return Get.offAll(() => const NavMenuVisitor());
      } else {
        if (deviceStorage.read('user_login')) {
          return Get.offAll(() => const NavMenu());
        }
        return Get.offAll(() => LoginUI());
      }
    }
  }
}
