 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/chips/choice_chip.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/common/widgets/text/Product_price_title.dart';
import 'package:t_store/common/widgets/text/TProductTitleText.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TProductAttribute extends StatelessWidget {
  const  TProductAttribute({super.key, required this.product});
 final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    final controller=Get.put(VariationController());
    
    return Obx(
      ()
      =>Column(
      children: [
         if(controller.selectedVariation.value.id.isNotEmpty) 
        TRoundedContainer(
         
          backgroundColor: dark?TColors.darkerGrey:TColors.grey,
          padding: const EdgeInsets.all(TSizes.md),
          child:Column(children: [ Row(
            children: [
             
             
              const TSelectionHeading(title: 'Variation', showActionButton: false,),
              const SizedBox(width: TSizes.spaceBtwInputFields,),
              Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TProductTitleText(text: 'Price:',smallSize: true,),
                      const SizedBox( width: TSizes.sm,),

                      if(controller.selectedVariation.value.salePrice>0)
                      Text('\$${controller.selectedVariation.value.price}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                     if(controller.selectedVariation.value.salePrice>0)
                      const SizedBox(width: TSizes.spaceBtwInputFields,),

                      ///Sale Price
                       TProductPriceText(price: controller.getVariationPrice()) ],
                  ),
                  
                       //Stock
                  Row(children: [
                  const  TProductTitleText(text:"Stock : ",smallSize: true,),
                    Text(controller.varitionStockStatus.value,style: Theme.of(context).textTheme.titleMedium,)

                  ],),
                
                  
                
                ],
                
              )
            ],

          ),

          /// Variation Description
            const TProductTitleText(text: 'This is the Description of the Product and it can go up to max 4 Lines',
                  smallSize: true,
                  maxLines: 4,
                  ),
          ])
          ),
        const SizedBox(height: TSizes.spaceBtwItems,),

     
       Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        product.productAttributes!.map((attribute) =>
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
             TSelectionHeading(title:attribute.name!,showActionButton: false,),
          const SizedBox(height: TSizes.spaceBtwItems/2,),
          //when ever it exced the limet it will push down
          Obx( 
            ()=> Wrap(
            spacing: 8,
            children: attribute.values!.map( (attributeValue) {
                       final isSelected=attributeValue==controller.selectedAttribute[attribute.name];
                       final available=controller.getAttributesAvailabilityInVarition(product.productVariations!, attribute.name!).contains(attributeValue) ;
                
                return TChoiceChip(
                  text: attributeValue,
                   selected: isSelected,
                onSelected: available
                ? (selected){ 
                  if(selected && available ){
                   controller.onAttributeSelected(product, attribute.name??'', attributeValue);  
                   }  }  : null); 
                }).toList()
           )
          )
         
           
           
           ],
          )
         ).toList()
         ,
      ),

      
      
      ],
    )
  );}


   
}