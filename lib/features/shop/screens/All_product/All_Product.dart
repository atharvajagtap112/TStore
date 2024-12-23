import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/loaders/TVerticalProductShimmer%20.dart';
import 'package:t_store/common/widgets/product/sortable/sortable_product.dart';
import 'package:t_store/features/shop/controllers/product/AllProductsController.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';

import 'package:t_store/common/widgets/product/sortable/sortable_product.dart';
import 'package:t_store/features/shop/controllers/product/AllProductsController.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  AllProducts({
    super.key,
    this.query,
    this.futureMethodList,
    required this.title,
  });

  final Query? query;
  final Future<List<ProductModel>>? futureMethodList;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Allproductscontroller());

    return Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder<List<ProductModel>>(
            future: futureMethodList ?? 
                    (query != null 
                      ? controller.fetchProductsByQuery(query!)
                      : Future.value([])), // Handle null query
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const TVerticalProductShimmer();
              }
        
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
        
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No products found'),
                );
              }
        
              final products = snapshot.data!;
        
              return TSortableProducts(
                product: products,
              );
            },
          ),
        ),
      ),
    );
  }
}
