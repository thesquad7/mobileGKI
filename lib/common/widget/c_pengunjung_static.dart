import 'package:MobileGKI/data/configVar.dart';
import 'package:flutter/material.dart';

import 'c_horizontal_card.dart';

class PengunjungCardCount extends StatelessWidget {
  const PengunjungCardCount(
      {super.key,
      required this.total,
      required this.t_jemaat,
      required this.t_visit,
      required this.stream,
      required this.pdt_name,
      required this.j_name,
      required this.j_cat,
      required this.j_bg,
      required this.j_date,
      required this.pdt_img,
      required this.j_place});
  final String total,
      t_jemaat,
      t_visit,
      stream,
      pdt_name,
      pdt_img,
      j_name,
      j_cat,
      j_bg,
      j_place,
      j_date;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: SizedBox(
          height: 230,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Total",
                              style: Theme.of(context).textTheme.labelSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Text(
                              total,
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Jemaat",
                              style: Theme.of(context).textTheme.labelSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Text(
                              t_jemaat,
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Partisipan",
                              style: Theme.of(context).textTheme.labelSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              t_visit,
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Online",
                              style: Theme.of(context).textTheme.labelSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            child: Text(
                              stream,
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              HorizontalCard(
                  isnetImgPendeta: true,
                  tanggal: j_date,
                  tema: j_name,
                  nama_pendeta: pdt_name,
                  img_pendeta:
                      ConfigBack.apiAdress + ConfigBack.imgInternet + pdt_img,
                  jenis_ibadah: j_cat,
                  img_bg: ConfigBack.apiAdress + ConfigBack.imgInternet + j_bg,
                  tempat: j_place,
                  isTempat: true)
            ],
          )),
    );
  }
}
