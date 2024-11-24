import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/image/t_circular_image.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Profile"),
      showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,

                child: Column(
                  children: [
                    TCircularImage(image: TImages.user,width: 80,height: 80,),
                     Text('Change Profile Picture'),
                     
                  ],
                ),
              ),

           const SizedBox(height: TSizes.spaceBtwSections/2,),
           const  Divider(),
           const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

              //Heading Personal Info 
            const TSelectionHeading(title: 'Profile Information', showActionButton: false,),
             const SizedBox( height: TSizes.spaceBtwItems),
             
             Profile_Menu(onTap: (){},  title: 'Name',  value: 'Atharva',),
             Profile_Menu(onTap: (){},  title: 'Username',  value: 'Atharva',),
             const SizedBox(height: TSizes.spaceBtwItems,),
              const  Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),
              
              //Heading Personal Info
            const TSelectionHeading(title: 'Personal Information', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),

             Profile_Menu(onTap: (){},  title: 'User ID',  value: '45668',icon: Iconsax.copy,),
             Profile_Menu(onTap: (){},  title: 'E-mail',  value: 'atharva@gmail.com',),
             Profile_Menu(onTap: (){},  title: 'Phone Number',  value: '+91 980-0000000',),
             Profile_Menu(onTap: (){},  title: 'Gender',  value: 'Male',),
             Profile_Menu(onTap: (){},  title: 'Date of Birth',  value: '05 Dec 2005',),
              
                 const SizedBox(height: TSizes.spaceBtwItems,),
                 
              Center(
                child: TextButton(onPressed: (){}, child: const Text('Close Account',style: TextStyle(color: Colors.red),)
                ),
              )
               ],
             

          ),
        ),
      ),
    );
  }
}
