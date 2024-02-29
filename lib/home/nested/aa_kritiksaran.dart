import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/home/d_config/widget/j_pendetapic.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:flutter/material.dart';

class KritikSaran extends StatelessWidget {
  const KritikSaran({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isNetworkImg = false;
    return FManagementPageDesign(
        child: Container(
          width: double.infinity,
          height: 80,
          child: Card(
            elevation: 6,
            child: Stack(
              children: [
                Positioned(
                    right: 10,
                    top: 15,
                    child: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {},
                    )),
                Positioned(
                  top: 10,
                  left: 70,
                  child: Column(
                    children: [
                      Text(
                        "text",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "text",
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: RoundedImgWithShadow(isNetworkImg: isNetworkImg)),
              ],
            ),
          ),
        ),
        pageTitle: "Kritik & Saran",
        itemCount: 5,
        autokeepalive: false,
        search: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        searchbutton: true);
  }
}

class RoundedImgWithShadow extends StatelessWidget {
  const RoundedImgWithShadow({
    super.key,
    required this.isNetworkImg,
  });

  final bool isNetworkImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: Offset(0, 3), // Shadow position
        ),
      ], borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: isNetworkImg ? null : Image.asset(Filemonimages.pendeta1)),
    );
  }
}
