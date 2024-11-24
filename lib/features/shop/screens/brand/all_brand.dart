import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/product/product_cards/TBrandCard.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
           const TSelectionHeading(title: 'Brands'),
           const SizedBox(height: TSizes.spaceBtwItems,),
            TGridlayout(
              itemCount: 10,
              mainAxisExtent: 80.0 ,
              itemBuilder: (_,index)=>  TBrandCard(ShowBorder: true, onTap: () =>Get.to(()=>const BrandProducts() ),))
          ],
        ),
        
        ),
      ),
    );
  }
}