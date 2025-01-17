import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/containers/TCircular_icon.dart';
import 'package:t_store/features/shop/controllers/product/favourite_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

class FavouriteIcon extends StatelessWidget {
   FavouriteIcon({super.key,  required this.productId});
String productId;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(FavouriteController());
    return Obx(()=>
      TCircularIcon(icon: controller.isFavorite(productId)? Iconsax.heart5 : Iconsax.heart ,

      color: controller.isFavorite(productId)? TColors.error: null,
      onPressed: ()=>controller.toggleFavoriteProduct(productId) ));
  }
}