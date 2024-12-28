import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/Order/order_repository.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/sucess_screen.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class OrderController extends GetxController { 
 static OrderController get instance=> Get.find();
  
  //Variable
  final cartController=CartController.instance;
  final addressController=AddressController.instance;
  final checkoutController=CheckoutController.instance;
  final orderRepository=Get.put(OrderRepository());

  //Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
      try {
      final list=await orderRepository.fetchUserOrders();
      return list;
      }catch(e){
        TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
       return [];
      }
  }

  //Add methods for order proccesing
  void processOrder( totalAmount) async {
       try{
            //start loader
            TFUILScreenLoader.openLoadingDialog('Processing your order', TImages.pencilAnimation);
            
            // Get user authentication Id 
            final userId=AuthenticationRepository.instance.authUser!.uid;
            if(userId.isEmpty)return; 

            //Add Details
            final order=OrderModel(
            id:UniqueKey().toString() ,
            userId: userId,
            status: OrderStatus.pending,
            totalAmount: totalAmount,
            orderDate: DateTime.now(),
            paymentMethod: checkoutController.selectedPaymentMethod.value.name,
            address: addressController.selectedAddress.value,
            //Set Date as needed
            deliveryDate: DateTime.now().add(Duration(days: 4)),
            items: cartController.cartItems.toList(),
              );

            //save the order to Firestore
            await orderRepository.saveOrder(order, userId);    

             //update the cart status
             cartController.clearCart();
              TFUILScreenLoader.stopLoading();
             //show success screen
             Get.off(()=> 
             SucessScreen(
              image: TImages.orderCompletedAnimation,
               title: 'Payment Success!', 
               subtitle: 'your item will be shipped soon!', 
               onPressed: ()=>Get.offAll(()=> const NavigationMenu())));

       } catch(e){
        TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
        TFUILScreenLoader.stopLoading();
       }
  }

}