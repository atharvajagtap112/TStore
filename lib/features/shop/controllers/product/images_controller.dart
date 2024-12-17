import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance=>Get.find();

  RxString selectedProductImage=''.obs;

  
  List<String> getAllProductImages( ProductModel product){
      //Use set to add unique images only
      Set<String> images={};   
      images.add(product.thumbnail!);
       selectedProductImage.value=product.thumbnail!;  

      images.addAll(product.images!);
       
     if(product.productVariations!=null&& product.productVariations!.isNotEmpty){
            images.addAll(product.productVariations!.map((variation)=> variation.image));
     }
      
      return images.toList();
  }


  // show image popup
   void showEnlargedImage(String image) {
  Get.dialog(
    Dialog.fullscreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.defaultSpace * 2,
                horizontal: TSizes.defaultSpace),
            child: CachedNetworkImage(imageUrl: image),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 150,
              child: OutlinedButton(
                onPressed: () => Get.back(),
                child: const Text('Close'),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

   
}