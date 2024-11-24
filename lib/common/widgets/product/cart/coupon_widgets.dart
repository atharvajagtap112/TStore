
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

import '../../../../utils/constants/sizes.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return   TRoundedContainer(
              backgroundColor: dark? TColors.dark:TColors.white,
              padding: const EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm,right: TSizes.sm, left: TSizes.md),
              child: Row(
                children: [
                  Flexible( // i
   child: TextFormField(
      decoration: const InputDecoration(
      
      //  labelText: 'Have a promo code? Enter here',  it will float
      hintText: 'Have a promo code? Enter here',
        //border is define in theme so remove it
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder:InputBorder.none,
        disabledBorder: InputBorder.none,
    
       
      ),
    )
    ),
     

                  SizedBox( width: 80,
                    child: ElevatedButton( 
                      style: ElevatedButton.styleFrom( 
                        backgroundColor: TColors.grey.withOpacity(0.2),
                        foregroundColor: dark?TColors.white.withOpacity(0.5):TColors.dark.withOpacity(0.5),//child color
                        side: BorderSide(color: Colors.grey.withOpacity(0.1))
                      ),
                      onPressed: (){}, child: const Text('Apply')))
                ],
              ),
            );
  }
}