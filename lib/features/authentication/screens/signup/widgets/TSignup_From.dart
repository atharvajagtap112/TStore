import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/social_button.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/TTermsAndConditions.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
   TSignupForm({
    super.key,
    
  });

 final controller=Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    bool dark=THelperFunctions.isDarkMode(context);
    return Form(
      key:controller.signupFormKey ,
      child: Column(
       
        children: [ 
          Row(
            children: [
              //First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator:(value)=> TValidator.validateEmptyText('First Name', value),
                  expands: false,
                decoration: const InputDecoration( labelText:  TTexts.firstName, 
                prefixIcon: Icon(Iconsax.user),
                )
                ),
                ),
              
    
              const SizedBox(width: TSizes.spaceBtwInputFields,),
              //Last Name
              Expanded(
                
                child: TextFormField(
                  controller: controller.lastName,
                   validator:(value)=> TValidator.validateEmptyText('Last Name', value),
                     expands: false,
                   decoration: const InputDecoration( labelText:  TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
    
         const  SizedBox (height: TSizes.spaceBtwInputFields),
              /// Username
             TextFormField(
              controller: controller.username,
              validator: (value) => TValidator.validateEmptyText('username', value),
                expands: false,
                       decoration: const InputDecoration (labelText: TTexts.username, prefixIcon: Icon (Iconsax.user_edit)),
                 ), // TextFormField
              const SizedBox (height: TSizes.spaceBtwInputFields),

              /// Email
              TextFormField(
                  controller: controller.email,
                  validator: (value) => TValidator.validateEmail(value),
               decoration: const InputDecoration (labelText: TTexts.email, prefixIcon: Icon (Iconsax.direct)),
                               ), // TextFormField
               const SizedBox (height: TSizes.spaceBtwInputFields),
                                   
              /// Phone Number
              TextFormField(
                  controller: controller.phoneNumber,
                  validator:(value)=> TValidator.validatePhoneNumber(value),
              decoration: const InputDecoration (labelText: TTexts.phoneNo, prefixIcon: Icon (Iconsax.call)),
                           ), // TextFormField
                     const SizedBox (height: TSizes.spaceBtwInputFields),
                       
                       //Password  
                   Obx(
                    () => TextFormField(
                        controller: controller.password,
                        
                          validator:(value)=> TValidator.validatePassword(value),
                                     obscureText: controller.hidePassword.value,
                                   decoration:  InputDecoration (
                                     labelText: TTexts.password,
                                      prefixIcon: const Icon (Iconsax.password_check),
                                     suffixIcon: IconButton (onPressed: () {
                     controller.hidePassword.value=!controller.hidePassword.value;
                                     },icon:controller.hidePassword.value? const Icon(Iconsax.eye_slash): const Icon(Iconsax.eye)),
                                    ), // InputDecoration
                      ),
                   ), // TextFormField
          const SizedBox (height: TSizes.spaceBtwSections),     
            
            //T&C
          const TTermAndConditions()   ,
            const SizedBox (height: TSizes.spaceBtwSections),
            SizedBox( width: double.infinity,
              child: ElevatedButton(onPressed:  (){controller.signup();} , child:const Text(TTexts.createAccount))
              ,

            ),
              const SizedBox( height: TSizes.spaceBtwSections,),
            TFormDivider(dark: dark, dividerText: TTexts.orSignUpWith),
    
            const SizedBox( height: TSizes.spaceBtwSections,),
             TSocialButtons()
              
                         ],
                     )
                     );
  }
}

