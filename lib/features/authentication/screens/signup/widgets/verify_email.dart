import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class VerifyEmailScreen extends StatelessWidget {

 VerifyEmailScreen({super.key, required this.email});
 final email;
final controller=Get.put(VerifyEmailController());// these will created whenever the function is called 
@override
Widget build (BuildContext context) {
return Scaffold(
appBar: AppBar(
  automaticallyImplyLeading: false,
  actions: [
    
    IconButton(onPressed: ()=>AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear) )
  ],
),
body:  SingleChildScrollView(
// Padding to Give Default Equal Space on all sides in all screens.
child:
Padding(
padding: const EdgeInsets.all(TSizes.defaultSpace),
child: Column(
children: [
/// Image
 Image(image:const AssetImage(TImages.deliveredEmailIllustration,),
 width: THelperFunctions.screenWidth() * 0.6,
  ),
  const SizedBox( height: TSizes.spaceBtwSections,),
/// Title & SubTitle
Text(TTexts.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
const SizedBox( height: TSizes.spaceBtwItems,),
Text(email,style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center),
const SizedBox( height: TSizes.spaceBtwItems,),
Text(TTexts.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
const SizedBox(height: TSizes.spaceBtwSections,),

/// Buttons
 SizedBox(width: double.infinity, child: ElevatedButton(
  onPressed: () =>Get.to(()=> controller.checkEmailVerificationStatus() ), child: const Text('continue')),),
 const SizedBox(height: TSizes.spaceBtwItems,),
 SizedBox(width:double.infinity ,child: TextButton(onPressed: ()=> controller.sendEmailVerifcation(), child: const Text('Resent Email')),),

]
),
// Column
),
// Padding
),
// SingleChildScrollView
);
// Scaffold
}
}