import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_function.dart';
import 'package:iconsax/iconsax.dart';


class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, 
    required this.text,
     this.icon=Iconsax.search_normal,  
      this.showBackground=true,
        this.showBorder=true,
         this.padding=const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace), 
         this.onTap
  });
 final String text;
  final IconData? icon;
  final bool showBackground , showBorder;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final  dark=THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
             width: TDeviceUtils.getScreenWidth(context),
             padding: const EdgeInsets.all(TSizes.md),
             decoration: BoxDecoration(
            color: showBackground 
              ? dark
              ? TColors.dark
              :TColors.light 
            :Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              border:showBorder? Border.all(color : TColors.grey):null, 
        ),
        
        child:Row(
          children: [ 
            Icon(icon,color:dark? TColors.darkerGrey: Colors.grey),
           const  SizedBox(width: TSizes.spaceBtwItems,),
           Text(text, style: Theme.of(context).textTheme.bodySmall!.apply(
            color: TColors.darkGrey
           ),)
          ],
        ) ,
        ),
      ),
    );
  }
}