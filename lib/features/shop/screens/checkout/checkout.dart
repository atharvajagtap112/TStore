import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/product/cart/coupon_widgets.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/sucess_screen.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/biling_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Order Review',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            const TCartItems(
              showAddRemoveButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //Coupon TextField

            const TCouponCode(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark? TColors.black:TColors.white,
              child:const Column(
                children: [
                  //Pricing
                  TBillingAmountSection(),
                  SizedBox( height: TSizes.spaceBtwItems,),

                  //Divider 
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  

                  TBillingPaymentSection(),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  
                  TBillingAddressSection()
                ],
              ),
            ),
          ]),
        ),

        bottomNavigationBar: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
         child:ElevatedButton(onPressed: ()=> Get.to(
          ()=> SucessScreen(
            image: TImages.successfulPaymentIcon,             
            title: 'Payment Success!',
            subtitle: 'Yours item will be shipped soon!',
             onPressed: ()=>Get.offAll(()=>const NavigationMenu()))),
         
          child:const Text('Checkout \$256.0')) ,
        ),
        );
  }
}
