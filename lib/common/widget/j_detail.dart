import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/common/widget/d_imgview.dart';
import 'package:MobileGKI/common/widget/jd_imgslide.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:MobileGKI/utils/theme/constrains/sizes.dart';
import 'package:flutter/material.dart';

class FDetailJadwal extends StatelessWidget {
  const FDetailJadwal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FilemonHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FDetailImgView(
              children: Container(
            child: FDetailImgSlider(),
          )),
          HeadDMetadata(),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Container(
              height: FilemonHelperFunctions.screenHeight(),
              width: double.infinity,
              child: Column(children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "12 Maret 2024",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: dark ? Colors.white24 : Colors.black45),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                        "ini adalah contoh text penjelasan medalam acara gereja dsb"),
                  ),
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}

class HeadDMetadata extends StatelessWidget {
  const HeadDMetadata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, left: 6),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Stack(children: [
          Positioned(
            left: 8,
            child: SizedBox(
              height: 80,
              child: RoundedIMG(
                imageUrl: Filemonimages.pendeta1,
              ),
            ),
          ),
          Positioned(
              left: 100,
              top: 2,
              child: Text(
                "Pendeta Name",
                style: Theme.of(context).textTheme.headlineSmall,
              )),
          Positioned(
              left: 100,
              top: 25,
              child: Text(
                "'" + "Tema Acara" + "'",
                style: Theme.of(context).textTheme.headlineMedium,
              )),
          Positioned(
              left: 100,
              top: 55,
              child: Text(
                "Jenis Acara",
                style: Theme.of(context).textTheme.bodyMedium,
              ))
        ]),
      ),
    );
  }
}
