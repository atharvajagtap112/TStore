import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/AppBar/tabbar.dart';
import 'package:t_store/common/widgets/containers/search_Container.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/product/product_cards/TBrandCard.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/shop/screens/brand/all_brand.dart';

import 'package:t_store/features/shop/screens/store/widgets/categorytab.dart';

import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                              
                                 TGridlayout( itemCount: 4, mainAxisExtent: 80.0,
                                              itemBuilder: (_,index){
                                            return  const TBrandCard( ShowBorder: true,);
                                              }
        ,
      ),     
                          ],
                        ),
                        ),
         
                                                      
                                                    
       bottom:const  TTabbar( 
         tabs: [
           
                Tab(child: Text('Sports')),
                Tab(child: Text('Furniture')),
                Tab(child: Text('Electronics')),
                Tab(child: Text('Clothes')),
                Tab(child: Text('Cosmetics')),
           
         ],
       )            
            )
      
            ];
          } ,
      
          
           body: const TabBarView(

            children: [
                 TCategoryTab() ,
                 TCategoryTab() ,
                 TCategoryTab() ,
                 TCategoryTab() ,
                 TCategoryTab() ,
                 


                 

            ]
           
           ) 
           ),
      ),
    );
  }
}

