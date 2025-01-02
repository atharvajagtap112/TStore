import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/image/t_circular_image.dart';
import 'package:t_store/common/widgets/text/Product_price_title.dart';
import 'package:t_store/common/widgets/text/TProductTitleText.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final darkMode=THelperFunctions.isDarkMode(context);
       final controller=ProductController.instance;              
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
            child: Text( '${controller.calculateSalePercentage(product.price, product.salePrice)}%' ,style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
           ),
          const SizedBox(width: TSizes.spaceBtwItems,),
            
            //Price
            if(product.productType==ProductType.single.toString()&& product.salePrice>0)
           Text('\$${product.price}',style: Theme.of(context).textTheme.titleSmall!.apply( decoration: TextDecoration.lineThrough),),
           
           if(product.productType==ProductType.single.toString()&& product.salePrice>0)
           const SizedBox(width: TSizes.spaceBtwItems,),  

          
            TProductPriceText(price:controller.getProductPrice(product),),
       
          
        ],),
        
         const SizedBox(height: TSizes.spaceBtwItems/1.5,),
        //Title 
           TProductTitleText(text: product.title, ),
         const SizedBox(height: TSizes.spaceBtwItems/1.5,),
        
        ///  Stock Status
        Row(
          children: [
              const  TProductTitleText(text: 'Status', ),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text(controller.getProductStock(product.stock),style: Theme.of(context).textTheme.titleMedium,)],
               ),
         const SizedBox(height: TSizes.spaceBtwItems/1.5,),

         Row(
          children: [
            TCircularImage(image: product.brand!.image,isNetworkImage: true,
            width: 32,
            height: 32,
            overlayColor: darkMode? TColors.white:TColors.black,
            ),

            TBrandTitlewithVerifiedIcon(title: product.brand!.name)
          ],
         )
      ],

    );
  }
}