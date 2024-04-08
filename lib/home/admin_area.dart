import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/interface.dart';
import 'package:MobileGKI/home/d_config/widget/aa_menubutton.dart';
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
                          while (index == 8) {
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
                          }
                          {
                            Get.to(() {
                              return FMenubuttonConfig.screen[index];
                            });
                          }
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
