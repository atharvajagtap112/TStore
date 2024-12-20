import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/loaders/brands_shimmer.dart';
import 'package:t_store/common/widgets/product/product_cards/TBrandCard.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
           const TSelectionHeading(title: 'Brands' , showActionButton: false,),
           const SizedBox(height: TSizes.spaceBtwItems,),
             Obx( (){ 
                                    if(controller.isLoading.value){ return const TBrandsShimmer();
                                    }
                                    if(controller.allBrands.isEmpty) {
                                    return Center(child: Text('No Data Found!' , style: Theme.of(context).textTheme.bodyMedium!.apply( color: Colors.white) ,),);   
                                    }
                                   return TGridlayout( itemCount: controller.allBrands.length, mainAxisExtent: 80.0,
                                                itemBuilder: (_,index){
                                              return   TBrandCard( ShowBorder: true, brand:controller.allBrands[index] , onTap: () => Get.to(()=> BrandProducts(brand:controller.allBrands[index])),);
                                                }
                                           ,
                         ); }),
          ],
        ),
        
        ),
      ),
    );
  }
}