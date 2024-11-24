import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/shodows.dart';
import 'package:t_store/common/widgets/containers/TCircular_icon.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/common/widgets/text/Product_price_title.dart';
import 'package:t_store/common/widgets/text/TProductTitleText.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/features/shop/screens/product_details/product_deails.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return  GestureDetector
    ( onTap: ()=>Get.to(()=>const ProductDeails()),
      child:
      
       Container(
        width: 180,
        
        padding:const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color :dark? TColors.darkerGrey:TColors.white,
        ),

        child: Column(
          children: [

            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark? TColors.dark:TColors.light,
              child: Stack(
                children: [
                  const TRoundedImage(imageUrl: TImages.productImage1,applyImageRadius: true  ,) ,
                 
                 Positioned(
                  top: 12,
                  left: 8,
                   child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                   padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                   child: Text("25%",style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black,),
                   )),
                 ),


                const Positioned( right: 0,
                                  top: 0,
                  child:  TCircularIcon(icon: Iconsax.heart5,color: Colors.red,))
                   ,
                  
                ], 
              ),
            ),
              
              const SizedBox(height: TSizes.spaceBtwItems/2,),
      
             const Padding(padding:EdgeInsets.symmetric(horizontal:  TSizes.sm),
                     child: SizedBox(
                      width: double.infinity,
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           TProductTitleText(text: 'Green Nike Air Shoes',smallSize: true,),
                           SizedBox(height: TSizes.spaceBtwItems/2,),
                           TBrandTitlewithVerifiedIcon(title: 'Nike')
                            ],
                       ),
                     ),
                   ),
                       
                          
                     

                     const Spacer(),//push text to down side
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                          children: [
                            //Price
                              const Padding(
                                padding: EdgeInsets.only(left: TSizes.sm),
                                child: TProductPriceText(price: '35.5' ,),
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
    );
  }
}