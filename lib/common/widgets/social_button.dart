
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/signIn/signIn_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
   TSocialButtons({
    super.key,
  });
  final controller=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
        
        Container(
         decoration: BoxDecoration(
           border:Border.all(color: TColors.grey),
           borderRadius: BorderRadius.circular(100)
         ),
         child: IconButton(onPressed: ()=> controller.googleSignIn(),
          icon:const Image( 
           height: TSizes.iconMd,
           width: TSizes.iconMd,
           image:AssetImage(TImages.google))),
        ) ,
       
      
          
         
     ],
    );
  }
}