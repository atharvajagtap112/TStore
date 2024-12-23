import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/common/widgets/product/favourite_icon.dart/favourite_icon.dart';
import 'package:t_store/features/shop/controllers/product/images_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';


class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.product,
   
  });

final ProductModel product;
 
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ImagesController());
    final images=controller.getAllProductImages(product);
      final dark=THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: 
    Container(
      color: dark?TColors.darkerGrey:TColors.light,
      child: Stack(
       children: [ 
         SizedBox(
          height: 400,
          child: Padding(
            padding:const EdgeInsets.all(TSizes.productImageRadius*2),
            child: Obx( ()=>
             Center(
                child: GestureDetector(
                  onTap: () => controller.showEnlargedImage(controller.selectedProductImage.value),
                  child: CachedNetworkImage(
                    imageUrl:controller.selectedProductImage.value, 
                    progressIndicatorBuilder:(_, __, progress) => CircularProgressIndicator( value: progress.progress, color: TColors.primary,) ,),
                )),
            ),
          )),
    
          Positioned(
            right: 0,
            bottom: 30,
            left: TSizes.defaultSpace,
            child: SizedBox(
               height: 80,
              child:  ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                   separatorBuilder:(_, __)=>const SizedBox(width: TSizes.spaceBtwItems,) , 
                   itemBuilder: (_,index)=>
                   
                   Obx( (){ 

                    final imageSelected=images[index]==controller.selectedProductImage.value;
                           return TRoundedImage(
                    onPressed: () => controller.selectedProductImage.value=images[index],
                    isNetworkImage: true,
                   width: 80,
                   backgroundColor: dark?TColors.dark:TColors.white,
                   border: Border.all(color: imageSelected? TColors.primary : Colors.transparent),
                   imageUrl: images[index]); 
                   } )
                 
                    
              ),
            ),
          ),
    
          //Appbar Icons
          TAppBar( showBackArrow: true, action: [FavouriteIcon(productId: product.id)],)
       ]
      ),
    )
    );
  }
}