// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:MobileGKI/home/d_config/widget/j_backgorundimgcard.dart';
import 'package:MobileGKI/home/d_config/widget/j_pendetaname.dart';
import 'package:MobileGKI/home/d_config/widget/j_pendetapic.dart';
import 'package:MobileGKI/home/d_config/widget/j_tanggal.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard(
      {super.key,
      required this.tanggal,
      this.tempat = "",
      required this.tema,
      required this.nama_pendeta,
      required this.img_pendeta,
      required this.jenis_ibadah,
      required this.img_bg,
      this.isnetImgPendeta = false,
      this.padding = const EdgeInsets.all(FilemonSized.borderRadiusSm),
      this.isThema = true,
      required this.isTempat,
      this.top_color = Colors.white,
      this.bottom_color = Colors.deepOrange});

  final String tanggal,
      tempat,
      tema,
      nama_pendeta,
      img_pendeta,
      jenis_ibadah,
      img_bg;
  final bool isnetImgPendeta, isTempat, isThema;
  final Color bottom_color, top_color;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: double.infinity,
        height: 160,
        child: Card(
          child: Container(
            child: Stack(children: [
              Column(children: [
                BackgoundImgCard(
                  fit: BoxFit.fitWidth,
                  isNetworkImage: isnetImgPendeta,
                  imageUrl: img_bg,
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: bottom_color,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
              ]),
              Container(
                width: double.infinity,
                height: 82,
                decoration: BoxDecoration(
                  color: top_color.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
              PendetaPic(
                isNetworkImg: isnetImgPendeta,
                imgurl: img_pendeta,
              ),
              Tanggal(
                tanggal: tanggal,
              ),
              PendetaName(
                pendetaname: nama_pendeta,
              ),
              Positioned(
                top: 85,
                left: 100,
                child: SizedBox(
                  width: FilemonHelperFunctions.screenWidth() * 0.68,
                  child: Text(
                    tema,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              isThema
                  ? Positioned(
                      top: 105,
                      left: 100,
                      child: SizedBox(
                        width: FilemonHelperFunctions.screenWidth() * 0.8,
                        child: Text(
                          jenis_ibadah,
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  : SizedBox(),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  width: 150,
                  child: isTempat
                      ? Text(tempat,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis)
                      : SizedBox(),
                ),
              )
            ]),
          ),
          elevation: 4,
        ),
      ),
    );
  }
}
