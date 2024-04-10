import 'dart:developer';

import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/home/d_config/widget/aa_menubutton.dart';
import 'package:MobileGKI/utils/constrains/aa_menubutton_config.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
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
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: FilemonSized.borderRadiusMd),
            child: GridView.builder(
                itemCount: 3,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: FilemonSized.gridViewSpacing,
                    crossAxisSpacing: FilemonSized.gridViewSpacing,
                    crossAxisCount: 3,
                    mainAxisExtent: 120),
                itemBuilder: (_, index) => Container(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() {
                            return FPersona.screen[index];
                          });
                          log(index.toString());
                        },
                        child: icondataAdmin(
                            icon: FPersona.menuIcon[index],
                            name: FPersona.menuname[index]),
                      ),
                    )),
          ),
        ]),
      ),
    );
  }
}
