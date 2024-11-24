import 'package:flutter/material.dart';

import 'package:t_store/utils/constants/colors.dart';

import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';


class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key, 
    this.color, 
    required this.icon, 
     this.backgroundColor, 
    this.onPressed, 
    this.height,
     this.width,
      this.size= TSizes.lg,
  });
 final color;
 final Color? backgroundColor;
 final VoidCallback? onPressed;
 final double?height,width,size;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height ,
      width: width,
     decoration: BoxDecoration(
       color: backgroundColor!=null? 
               backgroundColor!
               :THelperFunctions.isDarkMode(context)? TColors.black.withOpacity(0.9)
               : TColors.white.withOpacity(0.9),
       borderRadius: BorderRadius.circular(100)        
     ),
    child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color,size: size, )),
    );
  }
}