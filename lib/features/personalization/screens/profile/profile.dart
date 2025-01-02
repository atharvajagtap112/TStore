import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/image/t_circular_image.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/loaders/t_shimmerLoader.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller=UserController.instance;
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
              SizedBox(
                width: double.infinity,

                child: Column(
                  children: [
                      
                     Obx(
                      (){
                        final networkImage=controller.user.value.profilePicture;
                         final image=networkImage.isNotEmpty? networkImage: TImages.user;
                         if(controller. profileLoader.value) return const TShimmerEffect(width: 50, height: 50, radius: 50,);
                        return TCircularImage(image: image , isNetworkImage: networkImage.isNotEmpty, width: 80, height: 80,);
                      }
                     ),
                     TextButton(onPressed:()=> controller.uploadImageProfilePicture(), child:const Text('Change Profile Picture'))
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
             
             Obx(()=> Profile_Menu(onTap: ()=> Get.to(()=> const ChangeName()),  title: 'Name',  value: controller.user.value.fullName,)),
             Profile_Menu(onTap: (){},  title: 'Username',  value: controller.user.value.username,),
             const SizedBox(height: TSizes.spaceBtwItems,),
              const  Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),
              
              //Heading Personal Info
            const TSelectionHeading(title: 'Personal Information', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),

             Profile_Menu(onTap: (){   Clipboard.setData(ClipboardData(text: controller.user.value.id));
    
    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(content: Text('User ID copied to clipboard!')),
    );},  title: 'User ID',  value: controller.user.value.id,icon: Iconsax.copy,),
             Profile_Menu(onTap: (){},  title: 'E-mail',  value: controller.user.value.email,),
             Profile_Menu(onTap: (){},  title: 'Phone Number',  value: controller.user.value.phoneNumber,),
             Profile_Menu(onTap: (){},  title: 'Gender',  value: 'Male',),
             Profile_Menu(onTap: (){},  title: 'Date of Birth',  value: '05 Dec 2005',),
              
                 const SizedBox(height: TSizes.spaceBtwItems,),
                 
              Center(
                child: TextButton(
                  onPressed: ()=>UserController.instance.deleteAccountWarnigPopup(),
                   child: const Text('Close Account',style: TextStyle(color: Colors.red),)
                ),
              )
               ],
             

          ),
        ),
      ),
    );
  }
}
