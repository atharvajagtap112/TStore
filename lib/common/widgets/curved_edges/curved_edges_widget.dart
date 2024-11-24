import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/curved_edges/custom_curve_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key, required this.child,
  });
   final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurveEdges(),
      child: child,
    );
  }
}

