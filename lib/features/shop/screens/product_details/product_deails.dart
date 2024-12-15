import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widgets.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class ProductDeails extends StatelessWidget {
  const ProductDeails({super.key, required this.product});
final ProductModel product; 
  @override
  Widget build(BuildContext context) {
    final darkk=THelperFunctions.isDarkMode(context);
    return  Scaffold(
      bottomSheet: const TBottomAddToCart() ,
      
      body: SingleChildScrollView(
        child: Column(
          children: [
             /// Product Image Silder
            const TProductImageSlider(),

            // Product Details
             Padding(padding: const EdgeInsets.only(right:TSizes.defaultSpace, left: TSizes.defaultSpace,bottom:TSizes.defaultSpace),
             child: Column
             (
              children: [
                //Rating & Share Button
                const Rating_Share_Widget(),
                const TProductMetaData(),
                

                // --Attributes
                const TProductAttribute(),
                const SizedBox( height: TSizes.spaceBtwSections,),

                // --Checkout Button
                SizedBox(width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child:const Text('Checkout'))),
                 
                 ///Description
                const TSelectionHeading(title: "Description", showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems,),
               
               const ReadMoreText(
                 
                  'This is a Product description fo Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and noting else'
                , trimLines: 2,
                trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14,fontWeight:FontWeight.w800 ),
                ),
                const Divider(),

                // -Reviews
                
                const SizedBox(height: TSizes.spaceBtwItems,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const TSelectionHeading(title: 'Reviews (199)', showActionButton: false,),
                   IconButton(onPressed: ()=>Get.to(()=>const ProductReviewsScreen()), icon:const Icon(Iconsax.arrow_right_3,size: 18,)),
                  ],
                ) , 
                     const SizedBox(height: TSizes.spaceBtwSections,),
             
                    
              ],
       
             ),
             ),

          ],
        ),
      ),
    );
  }
}

