import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/utils/constrains/asset_string.dart';
import 'package:MobileGKI/utils/theme/constrains/c_ltexfield.dart';
import 'package:MobileGKI/utils/theme/constrains/c_textfield.dart';
import 'package:flutter/material.dart';

class BerandaFeedback extends StatelessWidget {
  const BerandaFeedback({super.key});
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
            imgUrl: Filemonimages.pendeta1,
            netImg: false,
          ),
          SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FTextField(title: "Pengirim"),
              )),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: SizedBox(
              height: 58,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: LTextField(title: "Masukan"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text("Kirim"))),
          )
        ]),
      ),
    );
  }
}
