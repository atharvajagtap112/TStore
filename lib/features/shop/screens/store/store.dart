import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/AppBar/tabbar.dart';
import 'package:t_store/common/widgets/containers/search_Container.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/loaders/brands_shimmer.dart';
import 'package:t_store/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/product/product_cards/TBrandCard.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/personalization/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/screens/brand/all_brand.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';

import 'package:t_store/features/shop/screens/store/widgets/categorytab.dart';

import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
    
  @override
  Widget build(BuildContext context) {
    final controller =Get.put(BrandController());
    final list=CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: list.length,
      child: Scaffold(
        appBar: TAppBar(
          title:  Text('Store',style: Theme.of(context).textTheme.headlineMedium),
          action: [
            TCardCounter(onPressed: (){})
          ],
        ),
        body: NestedScrollView(
          //Header
          headerSliverBuilder:(_,innerBoxISScrolled){// headerSliverBuilder required an Sliver Widgets these are specificaly for sliver designs
            return [
              SliverAppBar( 
                       automaticallyImplyLeading: false,
                       pinned: true,// are design is not gona move
                        floating: true, // when we are scroll toward upper side our appbar will be visible
                        backgroundColor: THelperFunctions.isDarkMode(context)? TColors.dark:TColors.white,
                        expandedHeight: 440,
      
                        flexibleSpace:  Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
                        child: ListView(
                             
                          shrinkWrap: true,
                          physics:  const NeverScrollableScrollPhysics(),
                          children: [
                               //Search Bar
                           const SizedBox( height: TSizes.spaceBtwItems,),
                           
                          const  TSearchContainer(text: "Search in Store",showBackground: false,padding: EdgeInsets.zero,),
                           const SizedBox( height: TSizes.spaceBtwItems,),
      
                            /// -- Feature Brands
                            TSelectionHeading(title: 'Feature Brands',onPressed: ()=> Get.to(()=> const AllBrandScreen()),),
      
                            const SizedBox(height: TSizes.spaceBtwItems/1.5,),
                              
                                 Obx( (){ 
                                    if(controller.isLoading.value){ return const TBrandsShimmer();
                                    }
                                    if(controller.featuredBrand.isEmpty) {
                                    return Center(child: Text('No Data Found!' , style: Theme.of(context).textTheme.bodyMedium!.apply( color: Colors.white) ,),);   
                                    }
                                   return TGridlayout( itemCount: controller.featuredBrand.length, mainAxisExtent: 80.0,
                                                itemBuilder: (_,index){
                                              return   TBrandCard( ShowBorder: true, brand:controller.featuredBrand[index] , 
                                              onTap: () => Get.to(()=> BrandProducts(brand: controller.featuredBrand[index] )));            
                                                                               }
                         ); }),
                          ],
                        ),
                        ),
         
                                                      
                                                    
       bottom:  TTabbar( 
         tabs: list.map((category) => Tab(child: Text(category.name ),)).toList(),
       )            
            )
      
            ];
          } ,
      
          
           body:  TabBarView(

            children: 
              list.map((category)=>  TCategoryTab(category:category )).toList()
            
           
           ) 
           ),
      ),
    );
  }
}

