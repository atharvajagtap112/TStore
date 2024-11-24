
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/containers/circular_container.dart';

import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';

import 'package:get/get.dart';
import 'package:t_store/utils/constants/sizes.dart';




class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banner,
  });
  final List<String> banner;
  @override
  Widget build(BuildContext context) {
        final controller=Get.put(HomeController());
    return Column(
      children: [
                CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          onPageChanged: (index,_)=>controller.updatePageIndex(index)
        ),
        items:banner.map( (url)=> TRoundedImage(imageUrl: url)).toList(),
       ),
       const SizedBox(height: TSizes.spaceBtwItems,),
       Center(
         child: Obx(()=>
            Row(
              mainAxisSize: MainAxisSize.min,
            children: [
              for(int i=0;i<banner.length;i++)
              TCircularContainer( width: 20,height: 4,margin: const EdgeInsets.only(right:10 ),
              backgroundColors:controller.carousalCurrentIndex.value==i? Colors.green:Colors.grey,)
            ],
           ),
         ),
       )
      ],
      
    
    );
  }
}

