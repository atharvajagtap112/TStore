import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';


class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
   
  });

 

  @override
  Widget build(BuildContext context) {
      final dark=THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: 
    Container(
      color: dark?TColors.darkerGrey:TColors.light,
      child: Stack(
       children: [ 
        const SizedBox(
          height: 400,
          child: Padding(
            padding: EdgeInsets.all(TSizes.productImageRadius*2),
            child: Center(child: Image(image: AssetImage(TImages.productImage5))),
          )),
    
          Positioned(
            right: 0,
            bottom: 30,
            left: TSizes.defaultSpace,
            child: SizedBox(
               height: 80,
              child:  ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                   separatorBuilder:(_, __)=>const SizedBox(width: TSizes.spaceBtwItems,) , 
                   itemBuilder: (_,index)=>
                   TRoundedImage(
                   width: 80,
                   backgroundColor: dark?TColors.dark:TColors.white,
                   border: Border.all(color: TColors.primary),
                   imageUrl: TImages.productImage3), 
                    
              ),
            ),
          ),
    
          //Appbar Icons
          TAppBar( showBackArrow: true, action: [IconButton(onPressed: (){}, 
          icon:const Icon(Iconsax.heart5 ,color:Colors.red,))],)
       ]
      ),
    )
    );
  }
}