import 'package:MobileGKI/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MobileGKI/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const NavigationBarApp()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        /*decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.cyan, Colors.greenAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)), */
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: Image.asset("assets/logo.png"),
            ),
            Text(
              'Mobile GKI',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              'Indramayu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
