import 'dart:developer';

import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_vertical_card.dart';
import 'package:MobileGKI/home/d_config/widget/aa_menubutton.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_category_persona.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_jemaat_page.dart';
import 'package:MobileGKI/home/nested/adminarea_child/persona/aap_pendeta_page.dart';
import 'package:MobileGKI/home/nested/beranda_child/b_productpagedetail.dart';
import 'package:MobileGKI/utils/constrains/aa_menubutton_config.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Persona extends StatelessWidget {
  Persona({super.key});
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
                title: "Menu Persona",
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
                      onPressed: () => Get.to(() => Pendeta()),
                      icon: FPersona.menuIcon[0],
                      b_title: FPersona.menuname[0],
                    ),
                    SubMenuButton(
                      onPressed: () => Get.to(() => Jemaat()),
                      icon: FPersona.menuIcon[1],
                      b_title: FPersona.menuname[1],
                    ),
                    SubMenuButton(
                      onPressed: () {
                        GetStorage().write("CategoryPlace", "0");
                        Get.to(() => PersonaCategory());
                      },
                      icon: FPersona.menuIcon[2],
                      b_title: FPersona.menuname[2],
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
