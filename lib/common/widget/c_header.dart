import 'package:MobileGKI/common/widget/costum_curve_widget.dart';
import 'package:MobileGKI/utils/theme/constrains/c_circlecontainer.dart';
import 'package:MobileGKI/utils/theme/constrains/colors.dart';
import 'package:flutter/material.dart';

class FilemonPrimaryHeaderCon extends StatelessWidget {
  const FilemonPrimaryHeaderCon({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FilemonCurveEdgeWidget(
      child: Container(
        color: FilemonColor.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                  top: 150,
                  right: -250,
                  child: FilemonTopContainer(
                      backgroundColor:
                          FilemonColor.textWhite.withOpacity(0.1))),
              Positioned(
                  top: -100,
                  right: -300,
                  child: FilemonTopContainer(
                      backgroundColor: FilemonColor.textWhite.withOpacity(0.1)))
            ],
          ),
        ),
      ),
    );
  }
}
