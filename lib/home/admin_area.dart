import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/home/d_config/widget/aa_menubutton.dart';
import 'package:MobileGKI/home/nested/adminarea_child/aa_persona.dart';
import 'package:MobileGKI/utils/constrains/aa_menubutton_config.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdminArea extends StatelessWidget {
  AdminArea({super.key});
  final deviceStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FilemonPrimaryHeaderCon(
            color: Colors.teal,
            height: FilemonSized.appBarHeight * 2.2,
            child: Column(children: [
              berandaAppbar(
                textGrettings: "Halo",
                textUser: deviceStorage.read("A_name"),
                areImage: true,
                are2line: true,
                areAction: true,
                Imgurl: ConfigBack.apiAdress +
                    ConfigBack.imgInternet +
                    deviceStorage.read("A_pic"),
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
              padding: EdgeInsets.all(0),
              child: SizedBox(
                height: FilemonHelperFunctions.screenHeight() * 0.8,
                width: FilemonHelperFunctions.screenWidth(),
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: FilemonSized.borderRadiusMd),
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                      crossAxisCount: 3,
                      children: <Widget>[
                        SubMenuButton(
                          onPressed: () =>
                              Get.to(() => FMenubuttonConfig.screen[0]),
                          icon: FMenubuttonConfig.menuIcon[0],
                          b_title: FMenubuttonConfig.menuname[0],
                        ),
                        SubMenuButton(
                          onPressed: () =>
                              Get.to(() => FMenubuttonConfig.screen[1]),
                          icon: FMenubuttonConfig.menuIcon[1],
                          b_title: FMenubuttonConfig.menuname[1],
                        ),
                        SubMenuButton(
                          onPressed: () =>
                              Get.to(() => FMenubuttonConfig.screen[2]),
                          icon: FMenubuttonConfig.menuIcon[2],
                          b_title: FMenubuttonConfig.menuname[2],
                        ),
                        SubMenuButton(
                          onPressed: () =>
                              Get.to(() => FMenubuttonConfig.screen[3]),
                          icon: FMenubuttonConfig.menuIcon[3],
                          b_title: FMenubuttonConfig.menuname[3],
                        ),
                        SubMenuButton(
                          onPressed: () =>
                              Get.to(() => FMenubuttonConfig.screen[4]),
                          icon: FMenubuttonConfig.menuIcon[4],
                          b_title: FMenubuttonConfig.menuname[4],
                        ),
                        SubMenuButton(
                          onPressed: () =>
                              Get.to(() => FMenubuttonConfig.screen[5]),
                          icon: FMenubuttonConfig.menuIcon[5],
                          b_title: FMenubuttonConfig.menuname[5],
                        ),
                        SubMenuButton(
                          onPressed: () =>
                              Get.to(() => FMenubuttonConfig.screen[6]),
                          icon: FMenubuttonConfig.menuIcon[6],
                          b_title: FMenubuttonConfig.menuname[6],
                        ),
                        SubMenuButton(
                          onPressed: () =>
                              Get.to(() => FMenubuttonConfig.screen[7]),
                          icon: FMenubuttonConfig.menuIcon[7],
                          b_title: FMenubuttonConfig.menuname[7],
                        ),
                        SubMenuButton(
                          onPressed: () {
                            FilemonHelperFunctions.showDialogData(
                                "Keluar", "Apakah anda yakin ingin keluar", () {
                              deviceStorage.write('user_login', false);
                              deviceStorage.write('IsFirstTime', false);
                              print(deviceStorage.read('user_login'));
                              print(deviceStorage.read('IsFirstTime'));
                              deviceStorage.remove('usertoken');
                              deviceStorage.remove('userC');
                              NavigationAdmin().toMain();
                            });
                          },
                          icon: FMenubuttonConfig.menuIcon[8],
                          b_title: FMenubuttonConfig.menuname[8],
                        ),
                      ],
                    )),
              )),
        ]),
      ),
    );
  }
}
