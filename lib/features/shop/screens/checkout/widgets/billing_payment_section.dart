import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return  Column(
      children: [
      
          TSelectionHeading(title: 'Payment Method', onPressed: (){}, buttonTitle: 'Change',),
             
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Row(
              children: [ 
                TRoundedContainer(
                  width: 60,
                  height: 35, 
                  backgroundColor: dark? TColors.light :TColors.white,
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: const Image(image: AssetImage(TImages.paypal)), ),

                    const SizedBox(width: TSizes.spaceBtwItems/2),
                    Text('Paypal',style: Theme.of(context).textTheme.bodyLarge,)
              ],
            )

        
        
      ],
    );
  }
}