import 'package:MobileGKI/home/navigation_ui/nav_menuadmin.dart';
import 'package:MobileGKI/home/navigation_ui/nav_menuvisitor.dart';
import 'package:MobileGKI/init/adminloginscreen.dart';
import 'package:MobileGKI/init/onboardingscreen.dart';
import 'package:MobileGKI/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

class App extends StatefulWidget {
  @override
  AppL createState() => AppL();
}

class AppL extends State<App> {
  final deviceStorage = GetStorage();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    deviceStorage.writeIfNull("isFirstTime", true);
    final isFirstime = deviceStorage.read("isFristTime");
    return GetMaterialApp(
        title: 'Mobile GKI Indramayu',
        themeMode: ThemeMode.system,
        theme: FilemonAppTheme.temaTerang,
        darkTheme: FilemonAppTheme.temaGelap,
        home: isFirstime
            ? const OnboardingScreen()
            : deviceStorage.read('useradmin')
                ? NavMenuVisitor()
                : deviceStorage.read('user_login')
                    ? NavMenu()
                    : LoginUI());
  }
}
