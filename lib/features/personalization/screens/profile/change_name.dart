import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/features/personalization/screens/profile/controller/update_name_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UpdateNameControler());
    return Scaffold(
      appBar:  TAppBar(
        showBackArrow: true,
        title:  Text('Change Name', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(padding:const EdgeInsets.all(TSizes.defaultSpace),
      child:Column(
        children: [
          Text(
            "Use real name for esay verification. This name will appear on several pages.",
            style: Theme.of(context).textTheme.labelMedium, ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            Form(
              key: controller.updateFormKey,
              child:Column(
                children: [
                  TextFormField(
                    expands: false,
                    controller: controller.firstName,
                    decoration:const InputDecoration(
                      labelText: 'First Name',
                      prefixIcon:  Icon(Iconsax.user)
                    ),
                  ),
                    
                const  SizedBox(height: TSizes.spaceBtwItems,),
                  TextFormField(
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: 'Last Name ',
                      prefixIcon:  Icon(Iconsax.user)
                    ),
                  )
                ],
              ) ),

             const SizedBox(height: TSizes.spaceBtwSections,),

              SizedBox(  width: double.infinity,child: ElevatedButton( onPressed: ()=>controller.updateUserName(), 
              child: const Text('Save')),)
        ],
      ) ,
      
      ),
    );
  }
}