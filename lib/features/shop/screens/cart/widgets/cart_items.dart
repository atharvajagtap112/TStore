import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:t_store/common/widgets/product/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/product/cart/cart_item.dart';
import 'package:t_store/common/widgets/text/Product_price_title.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';

import 'package:t_store/utils/constants/sizes.dart';



class TCartItems extends StatelessWidget {
  const TCartItems({
    this.showAddRemoveButton=true,
    super.key,
  });
   final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;
    return Obx(
   (){  
    final cartItems=controller.cartItems;
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __)=>const SizedBox(height: TSizes.spaceBtwSections,), 
      itemCount: cartItems.length,
      itemBuilder: (_,index) { 
        final item=cartItems[index];
        return  Column(
        children: [

          TCardItems( cartItem: cartItems[index],),

          if(showAddRemoveButton)
           const SizedBox(height: TSizes.spaceBtwItems,),
          if(showAddRemoveButton)
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
             const SizedBox(width: 70,),
            TProductQuantityWithAddRemoveButtons( 
                                  add:()=> controller.addOneToCart( cartItems[index]), 
                                  remove:()=> controller.removeOneItem(cartItems[index]),
                                  quantity: cartItems[index].quantity ,),
                 
            ]),
            TProductPriceText(price:(item.price*item.quantity).toStringAsFixed(1)//only show 1 value after decimal
             )
          ],
        ),
        
        ],
      );
      }
       ); }
    );
  }
}