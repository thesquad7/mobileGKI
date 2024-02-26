import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
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
                are2line: true,
                areAction: true,
                Imgurl: "assets/logo.png",
                imgH: 40,
                imgW: 40,
              )
            ]),
          ),
          Container(
              child: Text(
            "Menu Fitur",
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          Padding(
            padding: EdgeInsets.all(FilemonSized.borderRadiusLg),
            child: GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: FilemonSized.gridViewSpacing,
                    crossAxisSpacing: FilemonSized.gridViewSpacing,
                    crossAxisCount: 3,
                    mainAxisExtent: 120),
                itemBuilder: (_, index) => Container(
                      child: icondataAdmin(),
                    )),
          ),
        ]),
      ),
    );
  }
}

class icondataAdmin extends StatelessWidget {
  const icondataAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 2,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
          color: dark
              ? FilemonColor.white.withOpacity(0.1)
              : FilemonColor.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: dark
                ? FilemonColor.white.withOpacity(0.2)
                : FilemonColor.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.group,
              size: 70,
            ),
            Text("Jemaat")
          ]),
        ),
      ),
    );
  }
}
