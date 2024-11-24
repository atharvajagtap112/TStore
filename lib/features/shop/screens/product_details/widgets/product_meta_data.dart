import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/image/t_circular_image.dart';
import 'package:t_store/common/widgets/text/Product_price_title.dart';
import 'package:t_store/common/widgets/text/TProductTitleText.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode=THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & Sale Price
        Row(children: [
          ///Sale Tag
           TRoundedContainer(
            backgroundColor: TColors.secondary.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
            radius: TSizes.sm,
            child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
           ),
          const SizedBox(width: TSizes.spaceBtwItems,),
            
            //Price
           Text('\$250',style: Theme.of(context).textTheme.titleSmall!.apply( decoration: TextDecoration.lineThrough),),
           const SizedBox(width: TSizes.spaceBtwItems,),  
           const TProductPriceText(price:'175', isLarge: true,),
       
          
        ],),
        
         const SizedBox(height: TSizes.spaceBtwItems/1.5,),
        //Title 
         const  TProductTitleText(text: 'Green Nike Sport Shirt', ),
         const SizedBox(height: TSizes.spaceBtwItems/1.5,),
        
        ///  Stock Status
        Row(
          children: [
              const  TProductTitleText(text: 'Status', ),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text('InStock',style: Theme.of(context).textTheme.titleMedium,)],
               ),
         const SizedBox(height: TSizes.spaceBtwItems/1.5,),

         Row(
          children: [
            TCircularImage(image: TImages.shoeIcon,
            width: 32,
            height: 32,
            overlayColor: darkMode? TColors.white:TColors.black,
            ),

           const TBrandTitlewithVerifiedIcon(title: 'Nike')
          ],
         )
      ],

    );
  }
}