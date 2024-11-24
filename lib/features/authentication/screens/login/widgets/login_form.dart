

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signIn/signIn_controller.dart';
import 'package:t_store/features/authentication/screens/password_configuration.dart/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/signup.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
   TLoginForm({
    super.key,
  });
   final controller=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key:controller.loginFormKey,
      child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.spaceBtwSections
      ),
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value)=>TValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              
              labelText: TTexts.email
            ),
      
          ),
        const  SizedBox(height: TSizes.spaceBtwInputFields,),
           Obx(
                    () => TextFormField(
                        controller: controller.password,
                        
                          validator:(value)=> TValidator.validateEmptyText('Password',value),
                                     obscureText: controller.hidePassword.value,
                                   decoration:  InputDecoration (
                                     labelText: TTexts.password,
                                      prefixIcon: const Icon (Iconsax.password_check),
                                     suffixIcon: IconButton (onPressed: () {
                     controller.hidePassword.value=!controller.hidePassword.value;
                                     },icon:controller.hidePassword.value? const Icon(Iconsax.eye_slash): const Icon(Iconsax.eye)),
                                    ), // InputDecoration
                      ),
                   ),
        const   SizedBox(height: TSizes.spaceBtwInputFields/2,),
      
        ///Remember me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //row has horizontal mainAxis
            children: [
              ///Remember Me
              Row(
                children: [
                  Obx (()=> Checkbox(value: controller.rememberMe.value, onChanged: (value){ controller.rememberMe.value=value!;})),
                  const Text(TTexts.rememberMe)
               
                ],
                
              ),
               TextButton(onPressed: ()=> Get.to( ()=> ForgetPassword()), child: const Text(TTexts.forgetPassword))
            ],
            
          ),
         
            const SizedBox(height: TSizes.spaceBtwSections,),
               /// Sign in Button
               SizedBox(width:double.infinity ,child: ElevatedButton(onPressed: ()=>controller.emailAndPasswordSignIn(), child:const Text(TTexts.signIn)),),
              const SizedBox(height: TSizes.spaceBtwItems,),
                          
                 ///Create Account Button
               SizedBox(width:double.infinity ,child: OutlinedButton(onPressed: ()=> Get.to(()=> const signupScreen() ), child:const Text(TTexts.createAccount)),),
               const SizedBox(width: TSizes.spaceBtwItems,)
        ],
      
      ),
    ) 
    );
  }
}

