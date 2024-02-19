import 'package:MobileGKI/init/splash_screen.dart';
import 'package:MobileGKI/utils/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile GKI Indramayu',
      themeMode: ThemeMode.system,
      theme: FilemonAppTheme.temaTerang,
      darkTheme: FilemonAppTheme.temaGelap,
      home: const SplashScreen(),
    );
  }
}
