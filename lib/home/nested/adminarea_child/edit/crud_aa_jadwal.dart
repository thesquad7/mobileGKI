import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';

class JadwalCRUD extends StatefulWidget {
  const JadwalCRUD({super.key});

  @override
  State<JadwalCRUD> createState() => _JadwalCRUDState();
}

class _JadwalCRUDState extends State<JadwalCRUD> {
  DateTime tanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FDetailImgView(
            children: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
            imgUrl: Filemonimages.slide1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Row(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    child: Stack(children: [
                      RoundedIMG(imageUrl: Filemonimages.pendeta1),
                      Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                          ))
                    ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 240,
                    child: FTextField(title: "Nama Pendeta"),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: FTextField(title: "Tema/Judul"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: FTextField(title: "Status Pendeta"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: FTextField(title: "Tempat"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: Text(tanggal.toString()),
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Text("Pilih"),
                          onPressed: () async {
                            DateTime? newtanggal = await showDatePicker(
                              context: context,
                              initialDate: tanggal,
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2026),
                            );
                            if (newtanggal == null) return;
                            setState(() => tanggal = newtanggal);
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Text("Jam"),
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Text("Pilih"),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
