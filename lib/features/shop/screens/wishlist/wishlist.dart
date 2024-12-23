import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/containers/TCircular_icon.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/loaders/TVerticalProductShimmer%20.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/product/favourite_controller.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =FavouriteController.instance;
    return  Scaffold(
      appBar: TAppBar(title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
      action: [ 
        TCircularIcon(icon: Iconsax.add,onPressed: ()=> Get.to( HomeScreen()),
          
       )
      ],
       ),
       body: SingleChildScrollView(
      
         child: Padding(
           padding: const EdgeInsets.all(TSizes.defaultSpace),

           //Product Grid
           child: Column(
             children: [
               Obx(
             ()=> FutureBuilder(
                   future: controller.favoritesProducts(),
                   builder: (context, snapshot) {
                        
                     final emptyWidget= 
                     TAnimationLoaderWidget(
                      text: 'Whoops! Whishlist is Empty...', 
                      animation: TImages.pencilAnimation,
                      showAction: true,
                      actionText: 'Let\'s add some',
                      onActionPressed: ()=> Get.off(()=> const NavigationMenu()),
                      );
                        
                   final widget= CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: TVerticalProductShimmer(itemCount: 6,), nothingFound:emptyWidget );
                   if( widget!=null){
                       return widget;
                   }       
                     
                     final product=snapshot.data!;
                     return TGridlayout(
                      itemCount: product.length, 
                     
                      itemBuilder: (_,index)=>  
                      TProductCardVertical(product: product[index] ));
                   }
                 ),
               ),
             ],
           ),
         ),
       ),
    );
  }
}