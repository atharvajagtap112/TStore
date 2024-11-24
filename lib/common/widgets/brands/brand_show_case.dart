import 'package:flutter/material.dart';

import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';

import 'package:t_store/common/widgets/product/product_cards/TBrandCard.dart';

import 'package:t_store/utils/constants/colors.dart';

import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';


class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
     showBorder: true,
     borderColor: TColors.darkGrey,
           
         backgroundColor: Colors.transparent,    
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
           children: [
             const TBrandCard(ShowBorder: false),
    
             Row(
               children: images.map((images)=> brandTopProductImageWidget(images, context)).toList())
                 ],
          ),
    
    );
  }
}

Widget brandTopProductImageWidget(String image,context){
  return  Expanded(
                   child: TRoundedContainer(
                       height: 100,
                       margin: const EdgeInsets.only(right: TSizes.sm),
                       padding: const EdgeInsets.all(TSizes.md),
                       backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkGrey:TColors.light,
                       child: Image(fit: BoxFit.contain, image: AssetImage(image)),
                                          
                   ),
                 );
}