
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/containers/search_Container.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/shop/screens/all_product/All_Product.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_category.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_promoslider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                 THomeAppBar(),
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
                   const TPromoSlider(banner: [ TImages.promoBanner1,
                                                  TImages.promoBanner2,
                                                  TImages.promoBanner3     
                    ],),
                    const SizedBox(height: TSizes.spaceBtwSections,),

                    TSelectionHeading(title: 'Popular Product', onPressed:()=>Get.to(()=>const AllProducts()) ),
                       const SizedBox(height: TSizes.spaceBtwItems,),

                   TGridlayout(
  itemCount: 4,
  
  itemBuilder: (_, int index) {
    return  const TProductCardVertical(
      
    );
  },
)

                     
                  ],
                ),
              ),

            
                    
                    
                  
              
           
          ],
        ),
      )
    );
  }
}

