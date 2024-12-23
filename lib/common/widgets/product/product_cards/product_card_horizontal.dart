import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/common/widgets/product/favourite_icon.dart/favourite_icon.dart';
import 'package:t_store/common/widgets/text/Product_price_title.dart';
import 'package:t_store/common/widgets/text/TProductTitleText.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/product_deails.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TProductCardHorziontal extends StatelessWidget {
  const TProductCardHorziontal({super.key, required this.product});
 final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
     final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);
    return   GestureDetector(
      onTap: ()=> Get.to(()=> ProductDeails(product: product)),
      child: Container(
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
                    SizedBox(
                      height: 120,
                      width: 120,
                      child:  TRoundedImage(imageUrl:product.thumbnail.toString() , applyImageRadius: true, isNetworkImage: true,)),
                           
                     // Sale Tag         
                   if(salePercentage!=null)
                   Positioned(
                    top: 12,
                   
                     child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                     padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                     child: Text('$salePercentage%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black,),
                     )),
                   ),
      
                     
                     //Favourite Icon Button
                   Positioned( right: 0,
                                    top: 0,
                    child: FavouriteIcon(productId: product.id,))
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(text: product.title, smallSize: true,),
                        const SizedBox(height: TSizes.spaceBtwItems/2,),
                        TBrandTitlewithVerifiedIcon(title: product.brand!.name),
                      ],
                    ),
      
                  const  Spacer(), //These will push the row to bottom
      
                         Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              
                            children: [
                                 Flexible(
                                   child: Column(
                                    children: [
                                      if(product.salePrice>0 && product.productType==ProductType.single)
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
            )
            ],
          ),
      ),
    );
  }
}