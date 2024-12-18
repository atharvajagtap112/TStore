import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/product/product_cards/TBrandCard.dart';
import 'package:t_store/common/widgets/product/sortable/sortable_product.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const TAppBar( title: Text('Nike'),),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace) ,
        child:Column(
          children: [
            const TBrandCard(ShowBorder: true),
            const SizedBox(height: TSizes.spaceBtwItems,),
            TSortableProducts(product: const [],),
          ],
        )  ),
      ) 
    );
  }
}