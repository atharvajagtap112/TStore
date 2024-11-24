import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/screens/settings.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});
   
  @override
  Widget build(BuildContext context) {
     final controller=Get.put(NavigationController());
     final darkMode=THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar:  Obx( //these observer 
        ()=>NavigationBar( 
          height: 80,
          elevation: 0,    //when ever there is change in which we are using the controller it will automaticaly detec
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (value) =>
          controller.selectedIndex.value=value
        ,
        backgroundColor:darkMode?TColors.black:TColors.white ,
        indicatorColor: darkMode?TColors.white.withOpacity(0.1):TColors.black.withOpacity(0.1),
        destinations:const  [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'shop'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'heart'),
         NavigationDestination(icon: Icon(Iconsax.user), label: 'user')
        ]
      ),),
    body: Obx(()=> controller.screens[controller.selectedIndex.value]) ,
    
    );
  }
}

class NavigationController {
  final Rx<int>selectedIndex=0.obs;//what is being observed
   final screens=[const HomeScreen(),const StoreScreen(),const FavouriteScreen(),const SettingsScreen()];
}