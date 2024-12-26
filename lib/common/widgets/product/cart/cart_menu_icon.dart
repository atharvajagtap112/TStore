import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCardCounter extends StatelessWidget {
  const TCardCounter({
    super.key,  this.color=TColors.white, required this.onPressed,
  });
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CartController());
    return Stack(
      children: [
        IconButton(onPressed: ()=> Get.to(()=> const CartScreen()),
         icon: Icon(Iconsax.shopping_bag , color: color,)),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: TColors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100)
          
            ),
            child: Center(child: 
            Obx(
              ()=>
               Text(controller.noOfCartItems.toString(),style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white,fontSizeFactor: 0.8))),
          )
          ),
        )
      ]
    );
  }
}