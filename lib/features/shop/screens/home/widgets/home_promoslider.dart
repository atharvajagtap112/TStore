
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/containers/circular_container.dart';

import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';

import 'package:get/get.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/loaders/t_shimmerLoader.dart';




class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  
  @override
  Widget build(BuildContext context) {
       
        final controller=Get.put(BannerController());   
    return Obx( () {

     if(controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);
     if(controller.bannerList.isEmpty ) {
       return const Text('No Data Found!');
     } else{ return Column(
        children: [
          
                  CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index,_)=>controller.updatePageIndex(index)
          ),
          items:controller.bannerList.map(
             (banner)=> 
             TRoundedImage(
              fit: BoxFit.fill,
              imageUrl: banner.imageUrl, 
              isNetworkImage: true, 
              onPressed: () =>Get.toNamed(banner.targetScreen), 
              )).toList(),
         ),
         const SizedBox(height: TSizes.spaceBtwItems,),
         Center(
           child: Obx(()=>
              Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                for(int i=0;i<controller.bannerList.length;i++)
                TCircularContainer( width: 20,height: 4,margin: const EdgeInsets.only(right:10 ),
                backgroundColors:controller.carousalCurrentIndex.value==i? Colors.green:Colors.grey,)
              ],
             ),
           ),
         )
        ],
        
      
      );}
   } );
  }
}

