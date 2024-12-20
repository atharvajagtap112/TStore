import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TGridlayout extends StatelessWidget {
  const TGridlayout({super.key, 
  required this.itemCount, 
  this.mainAxisExtent=288.0,
   required this.itemBuilder});
  final int itemCount;
  final double mainAxisExtent;
  final Widget? Function(BuildContext,int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder (
                      shrinkWrap: true,
                      itemCount: itemCount,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                       gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent:mainAxisExtent ,// vertical SIze
                        crossAxisSpacing: TSizes.gridViewSpacing,
                        mainAxisSpacing: TSizes.gridViewSpacing
                        ), 
                       itemBuilder: itemBuilder,);
  }
}