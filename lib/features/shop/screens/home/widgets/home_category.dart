
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/features/shop/screens/subCategories/subcategories.dart';

import 'package:t_store/utils/constants/image_strings.dart';


class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
     height: 80,
      child: ListView.builder(
       shrinkWrap: true,
       scrollDirection: Axis.horizontal,
       itemCount: 6,
       itemBuilder: (_, index) {
         return //items 
            TVerticalImageText(image:TImages.shoeIcon ,title: 'Shoes',onTap: ()=> Get.to(()=> const SubCategoriesScreen()),);
       },
      ),
    );
  }
}





