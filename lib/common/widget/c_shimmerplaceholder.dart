import 'package:MobileGKI/utils/constrains/colors.dart';
import 'package:flutter/widgets.dart';

class ShimmerPlacehoder extends StatelessWidget {
  const ShimmerPlacehoder({super.key, this.height, this.width});

  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: FilemonColor.white.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
    );
  }
}
