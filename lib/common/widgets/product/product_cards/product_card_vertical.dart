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
import 'package:t_store/features/shop/controllers/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/product_deails.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key , required this.product});
 final ProductModel product; 
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);
    return  GestureDetector
    ( onTap: ()=>Get.to(()=> ProductDeails( product:product ,)),
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
                   TRoundedImage(imageUrl: product.thumbnail!,applyImageRadius: true  , isNetworkImage: true,) ,
                 
                 Positioned(
                  top: 12,
                  left: 8,
                   child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                   padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                   child: Text(salePercentage!,style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black,),
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
      
              Padding(padding: const EdgeInsets.symmetric(horizontal:  TSizes.sm),
                     child: SizedBox(
                      width: double.infinity,
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           TProductTitleText(text: product.title,smallSize: true,),
                           const SizedBox(height: TSizes.spaceBtwItems/2,),
                           TBrandTitlewithVerifiedIcon(title: product.brand!.name)
                            ],
                       ),
                     ),
                   ),
                       
                          
                     

                     const Spacer(),//push text to down side
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                          children: [
                               Flexible(
                                 child: Column(
                                  children: [
                                    if(product.salePrice!>0 && product.productType==ProductType.single)
                                    Padding( // shows the price 
                                padding: const EdgeInsets.only(left: TSizes.sm),
                                child:Text( controller.getProductPrice(product) , style: Theme.of(context).textTheme.labelMedium!.apply(decoration:TextDecoration.lineThrough),),
                              ),
                                      
                                      //Price shows sale price or main price if exist
                                     Padding(
                                padding: const EdgeInsets.only(left: TSizes.sm),
                                child: TProductPriceText(price: controller.getProductPrice(product) ,),
                              ),
                                  ],
                                 ),
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
