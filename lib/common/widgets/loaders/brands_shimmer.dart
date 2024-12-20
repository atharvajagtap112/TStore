import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/utils/loaders/t_shimmerLoader.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridlayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const TShimmerEffect(width: 300.0, height: 80.0),
    ); // TGridLayout
  }
}
