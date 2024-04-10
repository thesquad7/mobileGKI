import 'dart:developer';

import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetalisting.dart';
import 'package:MobileGKI/data/crud_state/pendeta/pendetaview.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_pendeta.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class Pendeta extends StatelessWidget {
  Pendeta({Key? key}) : super(key: key);

  PendetaController PController = Get.put(PendetaController());
  @override
  Widget build(BuildContext context) {
    final pendeta = GetStorage().read("P_name");
    return Obx(() => PController.isLoading.value
        ? Center(
            child: SizedBox(
              height: FilemonHelperFunctions.screenHeight(),
              width: FilemonHelperFunctions.screenWidth(),
              child: Lottie.asset(FilemonAnime.listloading),
            ),
          )
        : RefreshIndicator(
            color: Colors.cyan,
            onRefresh: () {
              return PController.getPendeta();
            },
            child: FManagementPageDesign(
                floatAButton: true,
                onPressed: () {
                  GetStorage().write("data", true);
                  GetStorage().write("pagetitle", "Tambah Pendeta");
                  Get.to(() => EditPendeta());
                },
                pageTitle: "Pendeta",
                itemCount: PController.jemaat.length,
                autokeepalive: false,
                searchbutton: false,
                child: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: PendetaItem(
                      Edit: () {
                        GetStorage().write("data", true);
                        GetStorage().write("pagetitle", "Perbaharui Pendeta");
                        APIGetPendetaInfo(
                                pendetaId:
                                    PController.jemaat[index].id.toString())
                            .getPendeta();
                        log(pendeta);
                        if (pendeta != null) {
                          Get.to(() => EditPendeta(
                                isNImg: true,
                              ));
                        }
                        ;
                      },
                      imngUrl: PController.jemaat[index].pic.toString(),
                      status: PController.jemaat[index].status.toString(),
                      nama: PController.jemaat[index].name.toString(),
                    ),
                  );
                }),
          ));
  }
}

class PendetaItem extends StatelessWidget {
  const PendetaItem({
    super.key,
    required this.nama,
    required this.status,
    required this.imngUrl,
    required this.Edit,
  });
  final String nama, status, imngUrl;
  final VoidCallback Edit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        height: 100,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoundedIMG(
                isNetworkImage: true,
                imageUrl:
                    ConfigBack.apiAdress + ConfigBack.imgInternet + imngUrl,
                height: 80,
              ),
              Container(
                width: 200,
                height: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      status,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                child: IconButton(
                  onPressed: Edit,
                  icon: Icon(Icons.edit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
