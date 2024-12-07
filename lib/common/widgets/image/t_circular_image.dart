import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'package:t_store/utils/helpers/helper_function.dart';
import 'package:t_store/utils/loaders/t_shimmerLoader.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
this.width=56,
this.height = 56,
this.backgroundColor,
this.overlayColor,
 this.padding= TSizes.sm,
required this.image,
this.fit=BoxFit.cover,

this.isNetworkImage= false,
  });
final BoxFit? fit;
final String image;
final bool isNetworkImage;
final Color? overlayColor;
final Color? backgroundColor;
final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // If image background color is null then switch it to light and dark mode color design
         color:backgroundColor ?? (THelperFunctions.isDarkMode(context) ?TColors.black:TColors.light),
         borderRadius: BorderRadius.circular(100)
             ),
     
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center( 
                
          child:isNetworkImage? 
             CachedNetworkImage(
              imageUrl: image,
             fit:fit,
             color: overlayColor,
              progressIndicatorBuilder: (context, url, progress) => const TShimmerEffect(width: 55, height: 55 , radius: 55,) ,
              errorWidget: (context, url, error) => const Icon(Icons.error),
             )
          :  
           Image(
            fit: fit,
            image: AssetImage(image) ,
            color: overlayColor,
              ),
        ),
      ));
  }
}