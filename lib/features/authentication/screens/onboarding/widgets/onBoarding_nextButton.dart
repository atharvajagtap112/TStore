import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class onBoarding_Next_Button extends StatelessWidget {
  const onBoarding_Next_Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return Positioned(bottom: TDeviceUtils.getBottomNavigationBarHeight(),
       right: TSizes.defaultSpace,
    
     child: ElevatedButton(style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor:dark?TColors.primary: Colors.black),
       onPressed: OnBoardingController.instance.nextPage, child:const Icon(Iconsax.arrow_right_3,
       )));

  }
}