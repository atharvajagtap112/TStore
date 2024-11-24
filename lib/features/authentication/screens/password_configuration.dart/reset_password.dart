import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email}  );
     final String email;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed:()=> Get.back(), icon: const Icon(CupertinoIcons.clear))],

      ),
      body:   SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image with 60% of screen width 
               Image(image: const AssetImage(TImages.deliveredEmailIllustration,),
                  width: THelperFunctions.screenWidth() * 0.6,  ),

               const SizedBox( height: TSizes.spaceBtwSections,),
             /// Title & SubTitle
            Text(TTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
             const SizedBox( height: TSizes.spaceBtwItems,),

            Text(TTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
             const SizedBox(height: TSizes.spaceBtwSections,),

/// Buttons
 SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.offAll(()=>const LoginScreen()), child:const Text(TTexts.done)),),   
 const SizedBox( height: TSizes.spaceBtwItems,),
                       
 SizedBox(
  width: double.infinity, 
  child: TextButton(
    onPressed: ()=>ForgetPasswordController.instance.resendPasswordResetEmail(email),
     //we have created the instance using the get.put in the forget password screen so by using then ForgetPasswordController.instance  
    
   // if we not have created the instance it will throw error

     child:const Text(TTexts.resendEmail)),),   
            ],
          ),
        ),
      ),
    );
  }
}