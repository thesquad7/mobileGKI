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
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const OnboardingScreen())
        : deviceStorage.read('useradmin')
            ? Get.offAll(() => const NavMenuVisitor())
            : deviceStorage.read('user_login')
                ? Get.offAll(() => const NavMenu())
                : Get.offAll(() => LoginUI());
  }
}
