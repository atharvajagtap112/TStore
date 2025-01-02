// First, let's create a CouponController to manage coupon logic
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';

class CouponController extends GetxController {
  static CouponController get instance => Get.find();
  
  final cartController = CartController.instance;
  final couponController = TextEditingController();
  RxBool isCouponValid = false.obs;
  RxDouble discountAmount = 0.0.obs;
  RxString appliedCouponCode = ''.obs;

  // Sample coupon data - In real app, this would come from a backend
  final Map<String, double> validCoupons = {
    'SAVE10': 0.10, // 10% discount
    'SAVE20': 0.20, // 20% discount
    'SAVE50': 0.50, // 50% discount
  };

  void applyCoupon(String code) {
    code = code.trim().toUpperCase();
    
    if (code.isEmpty) {
      TLoader.warningSnackBar(
        title: 'Empty Code',
        message: 'Please enter a coupon code',
      );
      return;
    }

    if (appliedCouponCode.value == code) {
      TLoader.warningSnackBar(
        title: 'Already Applied',
        message: 'This coupon is already applied',
      );
      return;
    }

    if (validCoupons.containsKey(code)) {
      // Calculate discount
      double discount = validCoupons[code]! * cartController.totalCartPrice.value;
      
      // Update values
      discountAmount.value = discount;
      isCouponValid.value = true;
      appliedCouponCode.value = code;
      
      // Update cart total price
      cartController.updatePriceWithDiscount(discount);
      
      TLoader.successSnackBar(
        title: 'Coupon Applied',
        message: 'Your coupon has been applied successfully!',
      );
      
      couponController.clear();
    } else {
      TLoader.errorSnackBar(
        title: 'Invalid Coupon',
        message: 'The entered coupon code is invalid',
      );
    }
  }

  void removeCoupon() {
    if (isCouponValid.value) {
      // Reset cart price to original
      cartController.updatePriceWithDiscount(  -discountAmount.value);
      
      // Reset coupon states
      discountAmount.value = 0.0;
      isCouponValid.value = false;
      appliedCouponCode.value = '';
      
      TLoader.successSnackBar(
        title: 'Coupon Removed',
        message: 'Coupon has been removed successfully',
      );
    }
  }

  @override
  void onClose() {
    couponController.dispose();
    super.onClose();
  }
}
