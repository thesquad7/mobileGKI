import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/configVar.dart';
import 'package:flutter/material.dart';

class HeadDMetadata extends StatelessWidget {
  const HeadDMetadata({
    super.key,
    required this.personname,
    required this.status,
    required this.jenisacara,
    required this.imgUrl,
  });
  final String personname, status, jenisacara, imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Stack(children: [
        Positioned(
          child: SizedBox(
            height: 80,
            child: RoundedIMG(
              isNetworkImage: true,
              imageUrl: ConfigBack.apiAdress + ConfigBack.imgInternet + imgUrl,
            ),
          ),
        ),
        Positioned(
            left: 100,
            top: 2,
            child: Text(
              personname,
              style: Theme.of(context).textTheme.headlineMedium,
            )),
        Positioned(
            left: 100,
            top: 32,
            child: Text(
              status,
              style: Theme.of(context).textTheme.bodyLarge,
            )),
        Positioned(
            left: 100,
            top: 55,
            child: Text(
              jenisacara,
              style: Theme.of(context).textTheme.bodyMedium,
            ))
      ]),
    );
  }
}
