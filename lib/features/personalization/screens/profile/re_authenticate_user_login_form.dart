import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return Scaffold(
      appBar:AppBar(title: const Text('Re-Authenticate User'),) ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key:controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value)=>TValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email,
                  ),
                ),
                     
                     const SizedBox(height: TSizes.spaceBtwInputFields,),
                Obx(
                  ()=> TextFormField(
                    controller: controller.verifyPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon:const Icon(Iconsax.password_check),
                      suffixIcon:IconButton(
                        onPressed: ()=>
                        controller.hidePassword.value= !controller.hidePassword.value, 
                        icon:controller.hidePassword.value? const Icon(Iconsax.eye_slash): const Icon(Iconsax.eye)) 
                    ),
                    obscureText: controller.hidePassword.value ,
                  ),
                ),
            
               const SizedBox(height: TSizes.spaceBtwSections,),
            
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()=>UserController.instance.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}