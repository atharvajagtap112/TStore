
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/containers/search_Container.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/loaders/TVerticalProductShimmer%20.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/screens/all_product/All_Product.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_category.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_promoslider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';



class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   final controller=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
   
    return    Scaffold(
    
      body: SingleChildScrollView(
        child: Column(
          children: [
              TPrimaryHeaderContainer(
              child:  Column(
                children:  [
                  //Custom AppBar
                 const THomeAppBar(),
                const  SizedBox(height: TSizes.spaceBtwSections,),

                   // Searchbar
                 const  TSearchContainer( text:'Search in Store' ,),

                    const  SizedBox(height: TSizes.spaceBtwItems,),

                  Padding(
                    padding: const EdgeInsets.only(left:  TSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Heading
                        TSelectionHeading(title:'Popular Categories' ,onPressed: (){},textColor: TColors.white,),
                        
                       const SizedBox(height: TSizes.spaceBtwItems,),
                          //category
                        const THomeCategory(),

                        const SizedBox( height: TSizes.spaceBtwSections,)
                    ],
                    ),
                  )
                     ],
              ), ),

              //Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TPromoSlider(),
                    const SizedBox(height: TSizes.spaceBtwSections,),

                    TSelectionHeading(title: 'Popular Product', onPressed:()=>Get.to(()=> AllProducts( productList: controller.fetchAllFeturedProduct(),)) ), 
                    
                    //Popular Products 

                    Obx(
                      (){
                        if(controller.isLoading.value) return const TVerticalProductShimmer();
                        if(controller.featuredProduct.isEmpty) return  Center(child: Text('No Data Found!' ,style: Theme.of(context).textTheme.bodyMedium,),);

                        return TGridlayout(itemCount: 4,itemBuilder: (_, int index) {
                     return   TProductCardVertical(product: controller.featuredProduct[index],);},);
                                                            } )                    
                  ],
                ),
              ),

            
                    
                    
                  
              
           
          ],
        ),
      )
    );
  }
}

