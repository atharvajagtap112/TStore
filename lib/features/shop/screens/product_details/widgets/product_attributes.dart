 import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/chips/choice_chip.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/common/widgets/text/Product_price_title.dart';
import 'package:t_store/common/widgets/text/TProductTitleText.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TProductAttribute extends StatelessWidget {
  const TProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
         
          backgroundColor: dark?TColors.darkerGrey:TColors.grey,
          padding: const EdgeInsets.all(TSizes.md),
          child:Column(children: [ Row(
            children: [
              const TSelectionHeading(title: 'Variation', showActionButton: false,),
              const SizedBox(width: TSizes.spaceBtwInputFields,),
              Column(
                children: [
                  Row(
                    children: [
                      const TProductTitleText(text: 'Price:',smallSize: true,),
                      Text('\$25',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                      const SizedBox(width: TSizes.spaceBtwInputFields,),

                      ///Sale Price
                      const TProductPriceText(price: '20') ],
                  ),
                       //Stock
                  Row(children: [
                  const  TProductTitleText(text:"Stock :",smallSize: true,),
                    Text('In Stock',style: Theme.of(context).textTheme.titleMedium,)

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
        children: [
          const TSelectionHeading(title:'Colors',showActionButton: false,),
          const SizedBox(height: TSizes.spaceBtwItems/2,),
          //when ever it exced the limet it will push down
          Wrap(
            spacing: 8,
            children: [
          TChoiceChip(text: 'Green', selected: true,onSelected: (value){},),
          TChoiceChip(text: 'Blue', selected: false,onSelected: (value){},),
          TChoiceChip(text: 'Yellow', selected: false,onSelected: (value){},),             
     
            ],
          )],
      ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TSelectionHeading(title:'Colors',showActionButton: false,),
          const SizedBox(height: TSizes.spaceBtwItems/2,),
          //when ever it exced the limet it will push down
          Wrap(
            spacing: 8,
            children: [
          TChoiceChip(text: 'EU 34', selected: true,onSelected: (value){},),
          TChoiceChip(text: 'EU 36', selected: false,onSelected: (value){},),
          TChoiceChip(text: 'EU 38', selected: false,onSelected: (value){},),             
     
            ],
          )],
      ),
      
      ],
    );
  }
}

