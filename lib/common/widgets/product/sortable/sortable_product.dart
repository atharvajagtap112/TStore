import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/product/AllProductsController.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
   const TSortableProducts({
    super.key, required this.product,
  });
    final List<ProductModel> product;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(Allproductscontroller());
       controller.assingToList(product);
    return Column(
      children: [ Obx(() =>  DropdownButtonFormField(
                   value: controller.sortValue.value,
                   onChanged: (sortOptions){ controller.sortProducts(sortOptions!);},
                      
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  items:['Name','Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
                  .map( (options)=> DropdownMenuItem( value: options,
                    child: Text(options))).toList() ),),
               

                         
                  const  SizedBox(height: TSizes.spaceBtwSections,),      
                 Obx(()=>TGridlayout(itemCount: controller.product.length, itemBuilder: (_,index)=> TProductCardVertical(product: controller.product[index],)) )  
      ],
    );
  }
}