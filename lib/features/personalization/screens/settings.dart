import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/list_tiles/setting_menu_tilte.dart';
import 'package:t_store/common/widgets/list_tiles/t_userprofile_tile.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/load_data.dart/upload.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child:Column(
                children: [
                  TAppBar(title: Text('Account',style: Theme.of(context).textTheme.headlineMedium, )),
                     
                     
               const TUserprofileTile(),

               const SizedBox(height: TSizes.spaceBtwSections,)
                ],
              ) 
              ),
              
              //body
              Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSelectionHeading(title: 'Account Settings', showActionButton: false,),
                  const SizedBox( height: TSizes.spaceBtwItems,),
                     
                    TSettingMenuTile(icon: Iconsax.safe_home,title: 'My Addresses', subTitle: 'Set shopping delivery address',onTap:()=> Get.to(()=>const UserAddressScreen())),
                    TSettingMenuTile(icon: Iconsax.shopping_cart,title: 'My Cart', subTitle: 'Add, remove product and move to checkout',onTap:()=>Get.to(const CartScreen())),
                    TSettingMenuTile(icon: Iconsax.bag_tick,title: 'My Orders', subTitle: 'In-progress and Complete Orders',onTap:()=> Get.to(()=>const OrderScreen()) ), 
                    //TSettingMenuTile(icon: Iconsax.bank,title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account',onTap:(){}),
                   // TSettingMenuTile(icon: Iconsax.discount_shape,title: 'My Coupons', subTitle:' List of all the discounted coupons',onTap:(){}),
                   // TSettingMenuTile(icon: Iconsax.notification,title: 'Notifications', subTitle: 'Set any kind of notification message',onTap:(){}),
                   // TSettingMenuTile(icon: Iconsax.security_card,title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts',onTap:(){}),
                    
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const TSelectionHeading( title : 'App Settings', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                     TSettingMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase',onTap: () => Get.to(()=> const UploadData()),  ),
                      
                     /* TSettingMenuTile(
                       icon: Iconsax.location,
                       title: 'Geolocation',
                       subTitle: 'Set recommendation based on location',
                       trailing: Switch(value: true, onChanged: (value) {}),
                          ),
                      // TSettingsMenuTile
                      TSettingMenuTile(
                       icon: Iconsax.security_user, 
                       title: 'Safe Mode',
                       subTitle: 'Search result is safe for all ages',
                       trailing: Switch(value: false, onChanged: (value) {}),
                          ), // TSettingsMenuTile
                      TSettingMenuTile(
                       icon: Iconsax.image,
                       title: 'HD Image Quality',
                       subTitle: 'Set image quality to be seen',
                        trailing: Switch (value: false, onChanged: (value) {}),
                           ),
                         // TSettingsMenuTile
                                 */
                         const SizedBox(height: TSizes.spaceBtwSections,),

                         SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(onPressed: ()=> AuthenticationRepository.instance.logout(), child: const Text('Logout')),
                         ),

                         const SizedBox(height: TSizes.spaceBtwSections*2.5,)
                ],
              ),
              
              )

              

          ],
        ),
      ),
    );
  }
}

