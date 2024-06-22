import 'package:MobileGKI/home/d_config/widget/j_backgorundimgcard.dart';
import 'package:MobileGKI/home/d_config/widget/j_pendetaname.dart';
import 'package:MobileGKI/home/d_config/widget/j_pendetapic.dart';
import 'package:MobileGKI/home/d_config/widget/j_tanggal.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    super.key,
    required this.tanggal,
    this.tempat = "",
    required this.tema,
    required this.nama_pendeta,
    required this.img_pendeta,
    required this.jenis_ibadah,
    required this.img_bg,
    this.isnetImgPendeta = false,
    this.isThema = true,
    required this.isTempat,
  });

  final String tanggal,
      tempat,
      tema,
      nama_pendeta,
      img_pendeta,
      jenis_ibadah,
      img_bg;
  final bool isnetImgPendeta, isTempat, isThema;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(FilemonSized.borderRadiusSm),
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
                    color: const Color.fromARGB(255, 102, 102, 102),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
              ]),
              PendetaPic(
                isNetworkImg: isnetImgPendeta!,
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
                child: Text(
                  tema,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              isThema
                  ? Positioned(
                      top: 105,
                      left: 100,
                      child: Text(
                        jenis_ibadah,
                        style: Theme.of(context).textTheme.headlineSmall,
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
