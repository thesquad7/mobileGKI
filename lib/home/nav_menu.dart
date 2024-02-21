import 'package:MobileGKI/home/beranda.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationCon());
    final darkMode = FilemonHelperFunctions.isDarkMode(context);

    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 70,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            backgroundColor: darkMode ? FilemonColor.black : FilemonColor.white,
            indicatorColor: darkMode
                ? FilemonColor.white.withOpacity(0.1)
                : FilemonColor.black.withOpacity(0.1),
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.church), label: "Warta"),
              NavigationDestination(icon: Icon(Icons.person), label: "Laporan"),
              NavigationDestination(
                  icon: Icon(Icons.account_circle_outlined), label: "Personal"),
            ],
          ),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationCon extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [const HomeScreen(), Container(), Container()];
}
