import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=AddressController.instance;
    return  Scaffold(
      appBar:const TAppBar( title: Text('Add new Address'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  decoration:const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),
                  validator: (value) => TValidator.validateEmptyText('Name', value),
                  ),
               const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                     controller: controller.phoneNumber,
                  decoration:const InputDecoration( prefixIcon: Icon( Iconsax.mobile),labelText: 'Phone Number'),
                validator: (value) => TValidator.validatePhoneNumber(value),
                ),
               const SizedBox(height: TSizes.spaceBtwInputFields,),

                Row(
                  children: [ 
                Expanded(child: TextFormField(
                     controller: controller.street,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),
                 validator: (value) => TValidator.validateEmptyText('Street', value),
                )),
                const SizedBox(width: TSizes.spaceBtwInputFields,),
                Expanded(child: TextFormField(
                     controller: controller.postalCode,
                  decoration:const InputDecoration( prefixIcon: Icon( Iconsax.code),labelText: 'Postal Code'),
                  validator: (value) => TValidator.validateEmptyText('Postal Code', value),
                )),
                  ],
                ),

                 const SizedBox(height: TSizes.spaceBtwInputFields,),
                 Row(
                  children: [ 
                Expanded(child: TextFormField(
                     controller: controller.city,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'),
                 validator: (value) => TValidator.validateEmptyText('City', value),
                )),
                const SizedBox(width: TSizes.spaceBtwInputFields,),
                Expanded(child: TextFormField(
                     controller: controller.state,
                  decoration:const InputDecoration( prefixIcon: Icon( Iconsax.activity),labelText: 'State'),
                 validator: (value) => TValidator.validateEmptyText('State', value),
                )),
                  
                  ],),

                 const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                     controller: controller.country,
                  decoration:const InputDecoration( prefixIcon: Icon( Iconsax.global),labelText: 'Country'),
                  validator: (value) => TValidator.validateEmptyText('State', value),
                ),
                          const SizedBox(height: TSizes.spaceBtwInputFields,),
                 SizedBox(width:double.infinity ,child:  ElevatedButton(onPressed: ()=> controller.addNewAddress(), child:const Text('Save')),)          

              ],
            )),
        ),
      ),
    );
  }
}