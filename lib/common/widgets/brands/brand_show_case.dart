import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';

import 'package:t_store/common/widgets/product/product_cards/TBrandCard.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';

import 'package:t_store/utils/constants/colors.dart';

import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';
import 'package:t_store/utils/loaders/t_shimmerLoader.dart';


class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images, required this.brand,
  });

  final List<String> images;
   final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(()=> BrandProducts(brand: brand)),
      child: TRoundedContainer(
       showBorder: true,
       borderColor: TColors.darkGrey,
             
           backgroundColor: Colors.transparent,    
            margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
             children: [
                TBrandCard(ShowBorder: false, brand: brand, ),
      
               Row(
                 children: images.map((images)=> brandTopProductImageWidget(images, context)).toList())
                   ],
            ),
      
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image,context){
  return   Expanded(
                   child: TRoundedContainer(
                        
                       height: 100,
                       margin: const EdgeInsets.only(right: TSizes.sm),
                       padding: const EdgeInsets.all(TSizes.md),
                       backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkGrey:TColors.light,
                       child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: image ,
                       progressIndicatorBuilder: (context, url, progress) => const TShimmerEffect(width: 100, height: 100),
                       errorWidget: (context, url, error) => const Icon(Icons.error),
                       )),
                                          
                   );
                 
}