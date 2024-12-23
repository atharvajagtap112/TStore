import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/brands/brand_show_case.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/loaders/TVerticalProductShimmer%20.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/personalization/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/All_product/All_Product.dart';
import 'package:t_store/features/shop/screens/store/widgets/CategoryBrands.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key, required this.category,
  });
final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller=CategoryController.instance;
    
    return  ListView(
      shrinkWrap: true,
     physics:const NeverScrollableScrollPhysics(),
      children: [ 
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
           CategoryBrands(category:category ,),

                FutureBuilder(
                 future: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                 builder: (context, snapshot) {
                    const loader=  TVerticalProductShimmer();
                   final widget= CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                   if(widget!=null) return widget;
                   final product=snapshot.data!;
                   return Column(
                    children: [
                      TSelectionHeading(title: 'You might like'
                      ,onPressed: ()=> 
                      Get.to(()=> 
                      AllProducts(title:category.name  ,futureMethodList: controller.getCategoryProducts(categoryId: category.id),)),),
                             TGridlayout(itemCount: product.length, itemBuilder: (_,index)=> 
                             TProductCardVertical(product:product[index])
                               )
                    ],
                   );
                 }
               )
          ],
        ),
      ),
      ]
    );
    
  }
}

