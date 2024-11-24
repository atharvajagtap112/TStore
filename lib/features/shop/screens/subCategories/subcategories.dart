import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const TAppBar(title: Text('Sports'), showBackArrow: true, ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage( imageUrl: TImages.banner3 , width: double.infinity, applyImageRadius: true,),
             const SizedBox(height: TSizes.spaceBtwSections),

              Column(
                children: [
                  TSelectionHeading(title: 'Sports Shirts', onPressed: (){}, ),
                  const SizedBox(height: TSizes.spaceBtwItems/2,),

                   SizedBox(
                    height: 120,
                     child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox( width: TSizes.spaceBtwItems,),
                      itemBuilder: (context,index)=>
                     const  TProductCardHorziontal()),
                   )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}