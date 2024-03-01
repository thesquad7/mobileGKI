import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:flutter/material.dart';

class FDetailImgView extends StatelessWidget {
  const FDetailImgView({
    super.key,
    required this.children,
    required this.imgUrl,
  });

  final Widget children;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return FilemonPrimaryHeaderCon(
        height: 300,
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          const FilemonAppBar(
            showBackArrow: true,
          ),
          children
        ]),
        color: Colors.purpleAccent);
  }
}
