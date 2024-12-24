import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.Address, required this.onTap });
   final AddressModel Address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final controller=AddressController.instance;
  
    final dark=THelperFunctions.isDarkMode(context);
    return 
  Obx(
    (){  
        final bool isSelected=controller.selectedAddress.value.id==Address.id;
      return InkWell(
          onTap: onTap,
          child: TRoundedContainer(
            width: double.infinity,
            showBorder: true,
            padding:const EdgeInsets.all(TSizes.md),
            backgroundColor: isSelected? TColors.primary.withOpacity(0.5) : Colors.transparent,
            borderColor: isSelected? Colors.transparent: 
            dark
            ? TColors.darkerGrey 
            :TColors.grey,
            margin:const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 4,
          
                  child: Icon( isSelected? Iconsax.tick_circle : null ,
                  color: isSelected? 
                  dark
                  ? TColors.light 
                  : TColors.dark 
                  :null,
                  
                  ),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                      ),
                     const SizedBox( height: TSizes.sm/2, ),
                      Text(Address.formattedPhoneNo,maxLines: 1,overflow: TextOverflow.ellipsis,),
                     const SizedBox( height: TSizes.sm/2, ),
                      Text( Address.toString() ,softWrap: true,)
                     
                    
                    ],
                  )
          
              ],
            ),
          ),
        
            ); 
  } ); 
  }
}
