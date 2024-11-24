import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key, 
    this.height=400,
    this.width=400, 
    this.radius=400, 
     this.padding=0, 
    this.child, 
     this.backgroundColors=TColors.white, 
      this.margin,
     
  });
  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColors;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        
        color: backgroundColors,
        borderRadius:BorderRadius.circular(radius))
      );
  }
}