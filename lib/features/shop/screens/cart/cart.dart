import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final controller=CartController.instance;
    return Scaffold(
      appBar: TAppBar( showBackArrow: true,title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,), ),
      body: Obx( (){ 
          final emptyWidget=TAnimationLoaderWidget(
            text:"Whoops! Cart is EMPTY", 
            animation: TImages.cartAnimation, 
            actionText: 'Let\'s fill it',
           showAction: true,
           onActionPressed: ()=> Get.off(()=>const NavigationMenu()),  
            );
           
          
           if(controller.cartItems.isEmpty){
            return emptyWidget;
           } 
           
          return const SingleChildScrollView(
            child:Padding(padding: EdgeInsets.all(TSizes.defaultSpace) ,
            child:Column(
              children: [
                TCartItems(),
              ],
            ),
            )
          );
          }),
       
       
        
   
     bottomNavigationBar: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
     child: ElevatedButton(
      onPressed: ()=>Get.to(()=> const CheckoutScreen()), child:  Obx(()=>Text('Checkout ₹${NumberFormat('#,##0.00').format(controller.totalCartPrice.value)}')))
     
     )
 );}
}



