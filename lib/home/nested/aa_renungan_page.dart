import 'package:MobileGKI/common/widget/c_fhorizontalcardImgbg.dart';
import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:flutter/material.dart';

class Renungan extends StatelessWidget {
  const Renungan({super.key});

  @override
  Widget build(BuildContext context) {
    return FManagementPageDesign(
        floatAButton: true,
        child: (_, index) {
          return Stack(children: [
            FHorizontalCardImgBG(
              imgUrl: Filemonimages.pendeta3,
            ),
            Positioned(
              right: 30,
              top: 65,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
            )
          ]);
        },
        pageTitle: "Renungan",
        itemCount: 10,
        autokeepalive: false,
        searchbutton: false);
  }
}
