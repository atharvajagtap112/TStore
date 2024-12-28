import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/common/widgets/text/TProductTitleText.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TCardItems extends StatelessWidget {
   const TCardItems({
    super.key,
    required this.cartItem, 
  });
final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
        TRoundedImage(
            width: 60,
            height: 60, 
            isNetworkImage: true,
            padding:const EdgeInsets.all(TSizes.sm), 
            imageUrl: cartItem.image!,
            backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkerGrey:TColors.light
            
       ),
       const SizedBox(width: TSizes.spaceBtwItems,),
       Expanded(
         child:  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             TBrandTitlewithVerifiedIcon(title: cartItem.brandName!,),
           Flexible (child:   TProductTitleText(text: cartItem.title,maxLines: 1,)),
            
            //Attributes
            Text.rich(
              TextSpan(
                children: (cartItem.selectedVariation??{})
                          .entries// these will loop througn all the selected variations
                          .map( //form that it will loop through all key and value pair of map insort it will loop through pair
                            (e)=> TextSpan( 
                             children: [ 
                                TextSpan( text:e.key ), 
                                TextSpan(text:  e.value)
                             ]
                          ) ).toList() ) )
          
          
    
          ],
         ),
       )
       ],
    );
  }
}