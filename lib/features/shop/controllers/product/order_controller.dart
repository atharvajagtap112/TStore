import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
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
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/helpers/pricing_calculator.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class OrderController extends GetxController { 
 static OrderController get instance=> Get.find();
  
  //Variable
  final cartController=CartController.instance;
  final addressController=AddressController.instance;
  final checkoutController=CheckoutController.instance;
  final orderRepository=Get.put(OrderRepository());

   late final Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    final totalAmount = TPricingCalculator.calculateTotalPrice(
      cartController.totalCartPrice.value,
      'US',
    );
    processOrder(totalAmount);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    TLoader.errorSnackBar(
      title: 'Payment Failed',
      message: response.message ?? 'An error occurred during payment',
    );
  }

  Future<void> startPayment(double amount) async {
    bool isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TLoader.customToast(message: 'No Network');
      return;
    }

    try {
      final user = AuthenticationRepository.instance.authUser;

         final options = {
      'key': 'rzp_test_LocOnkj4uO2xre',
      'amount': 1000,
      'name': 'Your Store Name',
      'description': 'Order Payment',
      'prefill': {
        'contact': user?.phoneNumber ?? '',
        'email': user?.email ?? '',
      },
      'currency': 'INR', // Change to INR for more payment methods
      'theme': {
        'color': '#000000',
      },
      // Enable specific payment methods
      'payment_methods': {
        'card': true,
        'netbanking': true,
        'upi': true,
        'wallet': true,
        'emi': true,
        'paylater': true,
      },
      // Bank specific settings
      'bank': {
        'netbanking': true, // Enable netbanking
      },
      // UPI specific settings
      'config': {
        'display': {
          'blocks': {
            'upi': {
              'widgets': [
                {'qrcode': true}, // Shows QR code for UPI
                {'intent': true} // Enables UPI intent flow
              ]
            },
            'banks': {
              'show': true // Shows bank selection
            },
          },
          'sequence': ['block.upi', 'block.wallet', 'block.netbanking', 'block.card'],
          'preferences': {
            'show_default_blocks': true
          }
        }
      },
      // Enable specific wallets
      'wallet': ['paytm', 'phonepe', 'amazonpay'],
    };

      _razorpay.open(options);
    } catch (e) {
      TLoader.errorSnackBar(
        title: 'Error',
        message: 'Unable to start payment. Please try again.',
      );
      debugPrint('Razorpay Error: $e');
    }
  }

 
 





   

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
            deliveryDate: DateTime.now().add(const Duration(days: 4)),
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