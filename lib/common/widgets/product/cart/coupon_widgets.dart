
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/features/shop/controllers/coupan_code_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../utils/constants/sizes.dart';

// Updated TCouponCode Widget
class TCouponCode extends StatelessWidget {
  const TCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final couponController = Get.put(CouponController());

    return Obx(
      () => Column(
        children: [
          TRoundedContainer(
            backgroundColor: dark ? TColors.dark : TColors.white,
            padding: const EdgeInsets.only(
              top: TSizes.sm,
              bottom: TSizes.sm,
              right: TSizes.sm,
              left: TSizes.md,
            ),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: couponController.couponController,
                    decoration: InputDecoration(
                      hintText: couponController.isCouponValid.value
                          ? 'Coupon Applied: ${couponController.appliedCouponCode.value}'
                          : 'Have a promo code? Enter here',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabled: !couponController.isCouponValid.value,
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: couponController.isCouponValid.value
                          ? TColors.error
                          :  dark? TColors.grey: TColors.dark,
                      foregroundColor: dark
                          ? TColors.dark 
                          : TColors.white,
                      side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                    ),
                    onPressed: () {
                      if (couponController.isCouponValid.value) {
                        couponController.removeCoupon();
                      } else {
                        couponController.applyCoupon(
                          couponController.couponController.text,
                        );
                      }
                    },
                    child: Text(
                      couponController.isCouponValid.value ? 'Remove' : 'Apply',
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (couponController.isCouponValid.value) ...[
            const SizedBox(height: TSizes.spaceBtwItems),
            TRoundedContainer(
              backgroundColor: TColors.primary.withOpacity(0.1),
              padding: const EdgeInsets.all(TSizes.sm),
              child: Row(
                children: [
                  const Icon(Icons.discount_outlined, color: TColors.primary),
                  const SizedBox(width: TSizes.sm),
                  Text(
                    'You saved \₹${couponController.discountAmount.value.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: TColors.primary,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
