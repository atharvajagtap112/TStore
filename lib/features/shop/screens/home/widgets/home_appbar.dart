

import 'package:flutter/material.dart';

import 'package:t_store/common/widgets/AppBar/appbar.dart';

import 'package:t_store/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';


class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
       
      title: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey,)),
          Text(TTexts.homeAppbarSubTitle,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white,)),
         ],
    
      ),
      action: [
        // cart
        TCardCounter(
          onPressed: (){},
          color: TColors.white,
        )
      ],
    );
  }
}
