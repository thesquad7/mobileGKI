// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:MobileGKI/common/widget/c_crud_bottomnav.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/c_ltexfield.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JadwalCRUD extends StatefulWidget {
  const JadwalCRUD({super.key});

  @override
  State<JadwalCRUD> createState() => _JadwalCRUDState();
}

class _JadwalCRUDState extends State<JadwalCRUD> {
  DateTime tanggal = DateTime.now();
  TimeOfDay jam = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final pendetaSize = FilemonHelperFunctions.screenWidthtoPendeta();
    return Scaffold(
      bottomNavigationBar: FCRUDNavigation(
        create: () {},
      ),
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
            imgUrl: Filemonimages.slide3,
            netImg: false,
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
                    width: pendetaSize,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 120,
                        child: Text(DateFormat.yMMMEd('id_ID')
                            .format(tanggal)
                            .toString()),
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Text("Pilih"),
                          onPressed: () async {
                            try {
                              DateTime? newtanggal = await showDatePicker(
                                  context: context,
                                  initialDate: tanggal,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2030));
                              if (newtanggal == null) return;
                              setState(() => tanggal = newtanggal);
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 80,
                          child: Text(
                            jam.format(context).toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Text("Pilih"),
                          onPressed: () async {
                            try {
                              TimeOfDay? newtime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());
                              if (newtime == null) return;
                              setState(() {
                                jam = newtime;
                              });
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: LTextField(title: "Deskripsi"),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
