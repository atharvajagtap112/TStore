import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TTabbar extends StatelessWidget implements PreferredSizeWidget{
   const TTabbar({super.key, required this.tabs});
   
    final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
   
    final dark= THelperFunctions.isDarkMode(context);
    return Material(
        color: dark? TColors.black:TColors.white,
         child: TabBar(
          tabs: tabs ,
            isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor:THelperFunctions.isDarkMode(context)? TColors.light:TColors.dark,
        labelColor: THelperFunctions.isDarkMode(context)? TColors.white:TColors.primary,
        
    ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight( TDeviceUtils.getAppBarHeight());
}
