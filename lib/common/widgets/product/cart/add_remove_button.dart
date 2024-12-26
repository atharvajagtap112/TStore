import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/containers/TCircular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';


class TProductQuantityWithAddRemoveButtons extends StatelessWidget {
  const TProductQuantityWithAddRemoveButtons({
    super.key, required this.quantity, required this.add, required this.remove,
  });
   final int quantity; 
   final VoidCallback add, remove; 
  @override
  Widget build(BuildContext context) {
    
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
         // decrease quantity
          InkWell(
             onTap: remove,
            child: TCircularIcon(
              icon:Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: THelperFunctions.isDarkMode(context)? TColors.white:TColors.black,
              backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkerGrey:TColors.light,
               ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems,),
         
         //quantity
         Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall,),
         const SizedBox(width: TSizes.spaceBtwItems,),
        
        //Increase Quantity
        InkWell(
          onTap: add,
          child: TCircularIcon(
          icon:Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context)? TColors.white:TColors.black,
          backgroundColor: TColors.primary,
           ),
        ), 
        ],
      );
  
  }
}

