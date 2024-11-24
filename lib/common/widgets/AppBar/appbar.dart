import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({super.key, 
                 this.title,  
                 this.showBackArrow =false, 
                 this.leadingIcon, 
                 this.action, this.leadingOnPressed});
  
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal:  TSizes.md),
      child: AppBar(
         backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading:showBackArrow
                   ? IconButton(onPressed: ()=>Get.back(), icon:  Icon( Iconsax.arrow_left, color: dark? TColors.white:TColors.black))
                  :leadingIcon!=null
                  ?  IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)  )
                  : null,
          title:title ,
          actions: action,

      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}