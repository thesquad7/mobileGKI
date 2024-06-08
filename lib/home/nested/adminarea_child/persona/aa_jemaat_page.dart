import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/jemaat/jemaatlisting.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_aa_jemaat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Jemaat extends StatelessWidget {
  Jemaat({Key? key}) : super(key: key);

  JemaatController JController = Get.put(JemaatController());
  @override
  Widget build(BuildContext context) {
    //DioService().getMethod('${ConfigBack.apiAdress}/admin/jemaat/');
    return Obx(() => FManagementPageDesign(
        floatAButton: true,
        onPressed: () {
          GetStorage().write("data", false);
          Get.to(() => EditJemaat());
        },
        pageTitle: "Jemaat",
        itemCount: JController.jemaat.length,
        autokeepalive: false,
        searchbutton: true,
        search: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        child: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: JemaatItem(
              imngUrl: JController.jemaat[index].j_pic.toString(),
              noInduk: JController.jemaat[index].jemaatId.toString(),
              nama: JController.jemaat[index].name.toString(),
              alamat: JController.jemaat[index].alamat.toString(),
            ),
          );
        }));
  }
}

class JemaatItem extends StatelessWidget {
  const JemaatItem({
    super.key,
    required this.noInduk,
    required this.nama,
    required this.alamat,
    required this.imngUrl,
  });
  final String noInduk, nama, alamat, imngUrl;

  @override
  Widget build(BuildContext context) {
    final deviceStorage = GetStorage();
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
                      noInduk,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      nama,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(alamat),
                  ],
                ),
              ),
              Container(
                width: 40,
                child: IconButton(
                  onPressed: () {
                    deviceStorage.write("data", true);
                    Get.to(() => EditJemaat());
                  },
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
