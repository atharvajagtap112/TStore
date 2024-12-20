

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/loaders/t_shimmerLoader.dart';


class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key, 
    this.width=double.infinity, 
    this.height=158, 
    required this.imageUrl, 
     this.applyImageRadius=true,
     this.border, 
      this.backgroundColor, 
     this.fit=BoxFit.contain,
      this.padding=const EdgeInsets.all(TSizes.sm), 
      this.isNetworkImage=false, 
      this.onPressed, 
       this.borderRadius=TSizes.md,
  });
  final double width,height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container( 
        height: height,
        width: width,
        padding: padding,
         decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
         
         ),
         child: ClipRRect( // add borderRadius to image
          borderRadius: applyImageRadius?
          BorderRadius.circular(borderRadius): BorderRadius.zero,
          child:  isNetworkImage? 
          CachedNetworkImage(imageUrl: imageUrl, fit: fit, progressIndicatorBuilder: (context, url, progress) => TShimmerEffect(width: double.infinity, height: height ),) 
          : Image(image: AssetImage(imageUrl), fit: fit,)),
      ),
    );
  }
}

