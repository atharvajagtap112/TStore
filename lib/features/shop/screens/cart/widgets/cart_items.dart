import 'package:flutter/material.dart';


import 'package:t_store/common/widgets/product/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/product/cart/cart_item.dart';
import 'package:t_store/common/widgets/text/Product_price_title.dart';

import 'package:t_store/utils/constants/sizes.dart';



class TCartItems extends StatelessWidget {
  const TCartItems({
    this.showAddRemoveButton=true,
    super.key,
  });
   final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __)=>const SizedBox(height: TSizes.spaceBtwSections,), 
    itemCount: 4,
    itemBuilder: (_,index)=>  Column(
      children: [
       const TCardItems(),
        if(showAddRemoveButton)
         const SizedBox(height: TSizes.spaceBtwItems,),
        if(showAddRemoveButton)
        const  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
            SizedBox(width: 70,),
            TProductQuantityWithAddRemoveButtons(),
               
          ]),
          TProductPriceText(price: '256')
        ],
      ),
      
      ],
    )
    
     );
  }
}