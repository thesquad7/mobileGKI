import 'package:MobileGKI/utils/theme/constrains/c_curve_edge.dart';
import 'package:flutter/material.dart';

class FilemonCurveEdgeWidget extends StatelessWidget {
  const FilemonCurveEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: FilemonConstumeCurvedEdgeds(), child: child);
  }
}
