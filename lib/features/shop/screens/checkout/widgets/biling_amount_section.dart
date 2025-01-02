import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/pricing_calculator.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;
    final subtotal=controller.totalCartPrice.value;
    return Obx(
     ()=>Column(
        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal',style: Theme.of(context).textTheme.bodyMedium,),
              Text('₹${controller.totalCartPrice.value}',style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems/2,),
      
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee',style: Theme.of(context).textTheme.bodyMedium,),
              Text('₹${TPricingCalculator.calculateShippingCost(controller.totalCartPrice.value, 'IND')}',style: Theme.of(context).textTheme.labelLarge,)
            
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems/2,),
      
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax Fee',style: Theme.of(context).textTheme.bodyMedium,),
              Text('₹${TPricingCalculator.calculateTax(controller.totalCartPrice.value, 'IND')}',style: Theme.of(context).textTheme.labelLarge,)
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems/2,),
      
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Total',style: Theme.of(context).textTheme.bodyMedium,),
              Text('₹${TPricingCalculator.calculateTotalPrice(controller.totalCartPrice.value,'IND')}',style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems/2,),
      
      
        ],
      ),
    );
  }
}