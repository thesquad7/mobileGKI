import 'package:MobileGKI/home/navigation_ui/nav_menuvisitor.dart';
import 'package:MobileGKI/init/adminloginscreen.dart';
import 'package:MobileGKI/init/config/onboarding_controller.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final deviceStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: FilemonSized.appBarHeight,
            left: FilemonHelperFunctions.screenWidth() * 0.46,
            child: Container(
              child: Text(
                "Hi!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnboardingPage(
                title: "Pengunjung Umum",
                animated_asset: Filemonimages.visitor,
                navigasi: () {
                  deviceStorage.write("useradmin", false);
                  deviceStorage.write("isFirstTime", false);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => const NavMenuVisitor()));
                },
              ),
              OnboardingPage(
                title: "Administrator",
                animated_asset: Filemonimages.admin,
                navigasi: () {
                  deviceStorage.write("useradmin", true);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LoginUI()));
                },
              )
            ],
          ),
          PageIndicator()
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: FilemonSized.appBarHeight,
        left: FilemonHelperFunctions.screenWidth() * 0.4,
        child: SmoothPageIndicator(
            effect: ExpandingDotsEffect(
                activeDotColor: dark ? Colors.teal : Colors.brown),
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 2));
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.animated_asset,
    required this.navigasi,
  });
  final String title, animated_asset;
  final VoidCallback navigasi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Container(
              width: FilemonHelperFunctions.screenWidth() * 0.8,
              height: FilemonHelperFunctions.screenHeight() * 0.6,
              child: Lottie.asset(animated_asset)),
          Text(
            "Saya adalah $title",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 10),
          Text(
            "Klik untuk masuk",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 10),
          Container(
              width: FilemonHelperFunctions.screenWidth() * 0.5,
              child: ElevatedButton(
                onPressed: navigasi,
                child: Text("Masuk"),
              ))
        ],
      ),
    );
  }
}
