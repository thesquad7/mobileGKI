import 'package:MobileGKI/init/splash_screen.dart';
import 'package:MobileGKI/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mobile GKI Indramayu',
      themeMode: ThemeMode.system,
      theme: FilemonAppTheme.temaTerang,
      darkTheme: FilemonAppTheme.temaGelap,
      home: const SplashScreen(),
    );
  }
}
