import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/loaders/TVerticalProductShimmer%20.dart';
import 'package:t_store/common/widgets/product/product_cards/TBrandCard.dart';
import 'package:t_store/common/widgets/product/sortable/sortable_product.dart';
import 'package:t_store/data/repositories/brands/brands_repository.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key , required this.brand});
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(BrandController());
    return   Scaffold(
      appBar:  TAppBar( title: Text(brand.name),),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace) ,
        child:Column(
          children: [
             TBrandCard(ShowBorder: true, brand: brand,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            FutureBuilder(
              future:  controller.getBrandProducts(brandId: brand.id),
               builder: (context, snapshot){
                  
                 if(snapshot.connectionState==ConnectionState.waiting) {
                    return const TVerticalProductShimmer();
                  }
                  if(!snapshot.hasData || snapshot.data==null || snapshot.data!.isEmpty) {
                    return  const Center( child: Text('No Data Found'),);
                  }

                  if(snapshot.hasError) return const Center( child: Text('Something went wrong'),);
                    
                  return  TSortableProducts(product: snapshot.data!, );
               })
           
          ],
        )  ),
      ) 
    );
  }
}