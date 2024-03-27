import 'package:MobileGKI/data/localrepo.dart';
import 'package:MobileGKI/home/navigation_ui/nav_menuadmin.dart';
import 'package:get/get.dart';

class NavigationAdmin {
  toMainScreen() {
    return Get.offAll(() => const NavMenu());
  }

  toMain() {
    return AuthRepos().screenRedirect();
  }
}
