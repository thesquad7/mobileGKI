// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:flutter/material.dart';

class FDetailImgView extends StatelessWidget {
  const FDetailImgView({
    super.key,
    required this.children,
    required this.imgUrl,
    this.title,
    required this.netImg,
    this.isInput = false,
  });

  final Widget children;
  final String imgUrl;
  final String? title;
  final bool netImg, isInput;

  @override
  Widget build(BuildContext context) {
    return FilemonPrimaryHeaderCon(
        height: 300,
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: netImg
                ? Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  )
                : isInput
                    ? Image.file(
                        File(imgUrl),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
          ),
          FilemonAppBar(
            title: title != null ? Text(title!) : null,
            showBackArrow: true,
          ),
          Positioned(bottom: 30, right: 10, child: children)
        ]),
        color: Colors.purpleAccent);
  }
}
