import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding:const EdgeInsets.all(TSizes.md),
      backgroundColor: selectedAddress? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress? Colors.transparent: 
      dark
      ? TColors.darkerGrey 
      :TColors.grey,
      margin:const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 4,

            child: Icon( selectedAddress? Iconsax.tick_circle : null ,
            color: selectedAddress? 
            dark
            ? TColors.light 
            : TColors.dark 
            :null,
            
            ),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
                ),
               const SizedBox( height: TSizes.sm/2, ),
               const Text('(+123) 456 7890',maxLines: 1,overflow: TextOverflow.ellipsis,),
               const SizedBox( height: TSizes.sm/2, ),
               const Text('82356 Timmy Coves,South Liana, Maine, 87665, USA',softWrap: true,)
               
              
              ],
            )

        ],
      ),
    );
  }
}
