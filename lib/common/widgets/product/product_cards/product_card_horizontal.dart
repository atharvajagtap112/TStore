import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/containers/TCircular_icon.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/common/widgets/text/Product_price_title.dart';
import 'package:t_store/common/widgets/text/TProductTitleText.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TProductCardHorziontal extends StatelessWidget {
  const TProductCardHorziontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return   Container(
        width: 310,
         padding:const EdgeInsets.all(1),
         decoration: BoxDecoration(
        
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color :dark? TColors.darkerGrey:TColors.softGrey,
        ),
        child: Row(
          children: [
            TRoundedContainer(
              height: 120,
              padding:const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark? TColors.dark:TColors.white,
              child: Stack(
                children: [
                 const SizedBox(
                    height: 120,
                    width: 120,
                    child:  TRoundedImage(imageUrl: TImages.productImage1 , applyImageRadius: true,)),
                         
                   // Sale Tag         
                 Positioned(
                  top: 12,
                
                   child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                   padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                   child: Text("25%",style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black,),
                   )),
                 ),

                   
                   //Favourite Icon Button
                const Positioned( right: 0,
                                  top: 0,
                  child:  TCircularIcon(icon: Iconsax.heart5,color: Colors.red,))
                   ,

                ],
              ),
            ),
          
           SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                 const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(text: 'Green Nike Hlaf Sleeves Shirt', smallSize: true,),
                      SizedBox(height: TSizes.spaceBtwItems/2,),
                      TBrandTitlewithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                const  Spacer(), //These will push the row to bottom

                  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                          children: [
                            //Price
                              const Padding(
                                padding: EdgeInsets.only(left: TSizes.sm),
                                child: Flexible(child: TProductPriceText(price: '256.0' ,)),
                              ),
      
                            Container(
                              decoration: const BoxDecoration(
                                color: TColors.dark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular( TSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(TSizes.productImageRadius)
                                )
                              ),
                              child:  const SizedBox(
                                height: TSizes.iconLg*1.2,
                                width: TSizes.iconLg*1.2,
                                child: Icon(Iconsax.add,color: TColors.light ,),
                              ),
                            )
                          ],
                         )
                ],
              ),
            ),
          )
          ],
        ),
    );
  }
}