

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';

import 'package:t_store/utils/constants/colors.dart';

import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_function.dart';
class TTermAndConditions extends StatelessWidget {
  const TTermAndConditions({
    super.key,
    
  });

 

  @override
  Widget build(BuildContext context) {
    final controller=SignupController.instance; // these will use the same instance which we have created
    bool dark=THelperFunctions.isDarkMode(context);
    return Row(
      
      children: [
      SizedBox( height: 24,
        width: 24,
        child: Obx(()=> Checkbox(value: controller.privacyPolicy.value,onChanged: (value) { controller.privacyPolicy.value=value!;},))),
       const SizedBox( width: 5,),
    Expanded(
      child: Text.rich(
        TextSpan(children: 
        [
            TextSpan(text:'${TTexts.iAgreeTo} ',style:Theme.of(context).textTheme.bodySmall,) ,
            TextSpan(text: '${TTexts.privacyPolicy} ',style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: dark?TColors.white:TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:  dark?TColors.white:TColors.primary
      
            )), 
            TextSpan(text: '${TTexts.and} ',style: Theme.of(context).textTheme.labelMedium),
            TextSpan(text: TTexts.termsOfUse,style: Theme.of(context).textTheme.labelMedium!.apply(
      
              color: dark?TColors.white:TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:  dark?TColors.white:TColors.primary
            ))                        
             
        ]
        )
      ),
    )
      ],);
  }
}