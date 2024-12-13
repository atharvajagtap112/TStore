
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/features/personalization/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/subCategories/subcategories.dart';

import 'package:t_store/utils/loaders/t_category_loader.dart';


class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CategoryController());
    return Obx((){
      if(controller.isLoading.value==true) return const TCategoryLoader();
      if(controller.featuredCategories.isEmpty) return  Center( child: Text('No Data Found!' ,style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
       return  SizedBox(
     height: 80,
      child: ListView.builder(
       shrinkWrap: true,
       scrollDirection: Axis.horizontal,
       itemCount: controller.featuredCategories.length,
       itemBuilder: (_, index) {
        final category=controller.featuredCategories[index];
         return //items 
            TVerticalImageText(image:category.image ,title: category.name,onTap: ()=> Get.to(()=> const SubCategoriesScreen()), isNetworkImage: true,);
       },
      ),
    );});
    
  }
}





