

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:t_store/utils/constants/colors.dart';

import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';


class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, 
    required this.image, 
    required this.title,
     this.isNetworkImage=false,

     this.textColor=TColors.white, 
    this.backgroundColor,
    this.onTap,
  }); 
  final isNetworkImage;
   final String image,title;
   final Color textColor;
   final Color? backgroundColor;
   final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
                 
    return GestureDetector(
      onTap: onTap,
      child: Padding(
      padding: const EdgeInsets.only(right:  TSizes.spaceBtwItems),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          Container(
            width: 56,
            height: 56,
            padding:const EdgeInsets.all(TSizes.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: backgroundColor??(THelperFunctions.isDarkMode(context)? TColors.black:TColors.white)
              
            ),
            child: Center(
              child:  isNetworkImage
                    ? CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                      color:THelperFunctions.isDarkMode(context)?  TColors.light : TColors.dark ,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: Colors.red),
                      )
                    : Image.asset(
                        image,
                        fit: BoxFit.cover,
                        color:THelperFunctions.isDarkMode(context)?  TColors.black : TColors.white ,
                      ),)
          ),
      
          const SizedBox(height: TSizes.spaceBtwItems/2,),
      
          Center(
            child: SizedBox(
              width: 55,
                  
              child: Text(title,style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              )),
          )
        ],
      ),
                                    ),
    );
  }
}



