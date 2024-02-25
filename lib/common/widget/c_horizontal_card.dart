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
    required this.tempat,
    required this.tema,
    required this.nama_pendeta,
    required this.img_pendeta,
    required this.jenis_ibadah,
    required this.img_bg,
  });

  final String tanggal,
      tempat,
      tema,
      nama_pendeta,
      img_pendeta,
      jenis_ibadah,
      img_bg;

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
                  isNetworkImage: false,
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
              Positioned(
                top: 105,
                left: 100,
                child: Text(
                  jenis_ibadah,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Positioned(
                bottom: 5,
                right: 10,
                child: Text(
                  tempat,
                  style: Theme.of(context).textTheme.headlineSmall,
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
