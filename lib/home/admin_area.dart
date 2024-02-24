import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:flutter/material.dart';

class AdminArea extends StatelessWidget {
  const AdminArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FilemonPrimaryHeaderCon(
            color: Colors.teal,
            height: 110,
            child: Column(children: [
              berandaAppbar(
                textGrettings: "Halo",
                textUser: "Pdt.Tiwan",
                areImage: true,
                Imgurl: "assets/logo.png",
                imgH: 40,
                imgW: 40,
              )
            ]),
          )
        ]),
      ),
    );
  }
}
