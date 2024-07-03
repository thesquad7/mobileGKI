import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:MobileGKI/data/crud_state/acara/acaralisting.dart';
import 'package:MobileGKI/data/crud_state/acara/public_acaralisting.dart';
import 'package:MobileGKI/utils/constrains/colorhandler.dart';
import 'package:MobileGKI/utils/controller/controller_home.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/c_circlecontainer.dart';
import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../data/crud_state/acara/acaraview.dart';

class FilemonHomeSlider extends StatefulWidget {
  FilemonHomeSlider({
    super.key,
  });

  @override
  State<FilemonHomeSlider> createState() => _FilemonHomeSliderState();
}

class _FilemonHomeSliderState extends State<FilemonHomeSlider> {
  final controller = Get.put(AcaraControllerPublic());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: controller.acara.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
                onTap: () async {
                  await APIGetAcaraViewPublic(
                          acaraId: controller.acara[index].id.toString())
                      .getAcara();
                },
                child: AcaraItem(
                    nama: controller.acara[index].name,
                    status: controller.acara[index].status,
                    catName: controller.acara[index].category_name,
                    imngUrl: controller.acara[index].pic,
                    indexCat: controller.acara[index].color_id!));
          },
          options: CarouselOptions(
              autoPlay: controller.acara.length <= 1 ? false : true,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
              viewportFraction: 1),
        ),
        SizedBox(height: FilemonSized.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < controller.acara.length; i++)
                  FilemonTopContainer(
                    width: 20,
                    heigth: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? FilemonColor.primary
                        : FilemonColor.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AcaraItem extends StatelessWidget {
  const AcaraItem({
    super.key,
    required this.nama,
    required this.status,
    required this.catName,
    required this.imngUrl,
    required this.indexCat,
  });
  final String nama, status, imngUrl, catName;
  final int indexCat;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        child: Stack(children: [
          Container(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                  child: Image.network(
                    ConfigBack.apiAdress + ConfigBack.imgInternet + imngUrl,
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(10))),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: CategoryColorHandler.categorycolor[indexCat]
                    .withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: CategoryColorHandler.categorycolor[indexCat]
                      .withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 100,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    catName,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 10,
            child: Container(
              width: FilemonHelperFunctions.screenWidth() * 0.95,
              child: Text(
                nama,
                style: Theme.of(context).textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: Container(
              width: 250,
              child: Text(
                status,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
            ),
          )
        ]));
  }
}
