import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/home/d_config/widget/aa_menubutton.dart';
import 'package:MobileGKI/utils/constrains/aa_menubutton_config.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminArea extends StatelessWidget {
  const AdminArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FilemonPrimaryHeaderCon(
            color: Colors.teal,
            height: 110,
            child: Column(children: [
              berandaAppbar(
                textGrettings: "Halo",
                textUser: "Pdt.Tiwan",
                areImage: true,
                are2line: true,
                areAction: true,
                Imgurl: "assets/logo.png",
                imgH: 40,
                imgW: 40,
              )
            ]),
          ),
          Container(
              child: Text(
            "Menu Fitur",
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          Padding(
            padding: EdgeInsets.all(FilemonSized.borderRadiusMd),
            child: GridView.builder(
                itemCount: 9,
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
                            return FMenubuttonConfig.screen[index];
                          });
                        },
                        child: icondataAdmin(
                            icon: FMenubuttonConfig.menuIcon[index],
                            name: FMenubuttonConfig.menuname[index]),
                      ),
                    )),
          ),
        ]),
      ),
    );
  }
}
