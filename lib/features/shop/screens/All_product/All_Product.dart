import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/loaders/TVerticalProductShimmer%20.dart';
import 'package:t_store/common/widgets/product/sortable/sortable_product.dart';
import 'package:t_store/features/shop/controllers/product/AllProductsController.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
   AllProducts({super.key,  this.query , this.productList});
  final Query? query;
   Future<List< ProductModel>>? productList;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(Allproductscontroller());
    return  Scaffold(
      appBar: const TAppBar(title: Text('Popular Product' ),showBackArrow: true,),
     
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        
        child:  FutureBuilder(
          future: productList?? controller.fetchProductsByQuery(query!) ,
          // since we dont have a await to use in build to wait for FutureList we can use future builder
           builder: (context, snapshot) {
                  
                  if(snapshot.connectionState==ConnectionState.waiting) {
                    return const TVerticalProductShimmer();
                  }
                  if(!snapshot.hasData || snapshot.data==null || snapshot.data!.isEmpty) {
                    return  const Center( child: Text('No Data Found'),);
                  }

                  if(snapshot.hasError) return const Center( child: Text('Something went wrong'),);
                    
                  return  TSortableProducts(product: snapshot.data!, );

           },)  
        ),
      ),
    );
  }
}

