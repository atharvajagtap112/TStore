import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_show_case.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
     physics:const NeverScrollableScrollPhysics(),
      children: [ 
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
           const TBrandShowCase (
             images: [ TImages.productImage3, TImages.productImage2, TImages.productImage1,],
             ),

             const TBrandShowCase (
             images: [ TImages.productImage3, TImages.productImage2, TImages.productImage1,],
             ),
      
            TSelectionHeading(title: 'You might like',onPressed: (){},),
          TGridlayout(itemCount: 4, itemBuilder: (_,index)=> 
          TProductCardVertical(product: ProductController.instance.featuredProduct[index])
            )
          ],
        ),
      ),
      ]
    );
    
  }
}

