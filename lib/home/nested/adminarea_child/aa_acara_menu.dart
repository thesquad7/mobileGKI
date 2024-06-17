// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_import

import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/home/d_config/widget/aa_menubutton.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/aama_category_persona.dart';
import 'package:MobileGKI/home/nested/adminarea_child/acara_menu/list_aama_acara.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_category_persona.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_jemaat_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_pendeta_page.dart';
import 'package:MobileGKI/utils/constrains/aa_menubutton_config.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AcaraMenu extends StatelessWidget {
  AcaraMenu({super.key});
  final deviceStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FilemonPrimaryHeaderCon(
            color: Colors.teal,
            height: FilemonSized.appBarHeight * 2,
            child: Column(children: [
              berandaAppbar(
                title: "Menu Acara",
                areImage: false,
                are2line: false,
                areAction: false,
              )
            ]),
          ),
          SizedBox(
            height: FilemonHelperFunctions.screenHeight() * 0.8,
            width: FilemonHelperFunctions.screenWidth(),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: FilemonSized.borderRadiusMd),
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: <Widget>[
                    SubMenuButton(
                      onPressed: () {
                        GetStorage().write("CategoryPlace", "1");
                        Get.to(() => AcaraCategory());
                      },
                      icon: FAcaraMenu.menuIcon[0],
                      b_title: FAcaraMenu.menuname[0],
                    ),
                    SubMenuButton(
                      onPressed: () => Get.to(() => Acara()),
                      icon: FAcaraMenu.menuIcon[1],
                      b_title: FAcaraMenu.menuname[1],
                    ),
                  ],
                )),
          )
        ]),
      ),
    );
  }
}

class SubMenuButton extends StatelessWidget {
  const SubMenuButton({
    super.key,
    required this.onPressed,
    required this.b_title,
    required this.icon,
  });
  final VoidCallback onPressed;
  final String b_title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: icondataAdmin(icon: icon, name: b_title),
    );
  }
}
