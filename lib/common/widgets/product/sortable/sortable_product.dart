import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/product_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                DropdownButtonFormField(
                  
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  items:['Name','Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
                  .map( (options)=> DropdownMenuItem( value: options,
                    child: Text(options))).toList() ,
                   onChanged: (value){}),
                         
                   const SizedBox(height: TSizes.spaceBtwSections,),      
                   TGridlayout(itemCount: 4, itemBuilder: (_,index)=> TProductCardVertical(product: ProductController.instance.featuredProduct[index],))
      ],
    );
  }
}