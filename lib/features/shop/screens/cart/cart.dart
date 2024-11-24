import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/containers/TCircular_icon.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar( showBackArrow: true,title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,), ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child:TCartItems(),
        ),
      ),
     bottomNavigationBar: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
     child: ElevatedButton(onPressed: ()=>Get.to(()=>const CheckoutScreen()), child: const Text('Checkout \$256.0')),
     ), 
    );
  }
}



class TProductQuantityWithAddRemoveButtons extends StatelessWidget {
  const TProductQuantityWithAddRemoveButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon:Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context)? TColors.white:TColors.black,
          backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkerGrey:TColors.light,
           ),
          const SizedBox(width: TSizes.spaceBtwItems,),
       Text('2', style: Theme.of(context).textTheme.titleSmall,),
       const SizedBox(width: TSizes.spaceBtwItems,),
      TCircularIcon(
      icon:Iconsax.add,
      width: 32,
      height: 32,
      size: TSizes.md,
      color: THelperFunctions.isDarkMode(context)? TColors.white:TColors.black,
      backgroundColor: TColors.primary,
       ), 
      ],
    );
  }
}

