import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/containers/TCircular_icon.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/screens/home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
      action: [ 
        TCircularIcon(icon: Iconsax.add,onPressed: ()=> Get.to( HomeScreen()),
          
       )
      ],
       ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             TGridlayout(itemCount: 6, mainAxisExtent: 270.0,itemBuilder: (_,index)=>  TProductCardVertical(product: ProductController.instance.featuredProduct[index], )),
           ],
         ),
       ),
    );
  }
}