import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSelectionHeading(title: 'Shipping Address' , buttonTitle: 'Change', onPressed: (){},),

        Text('Coding with T' , style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.spaceBtwItems/2,),

        Row(
          children: [
           const  Icon(Icons.phone, color: Colors.grey, size: 16,) ,
            const SizedBox( width: TSizes.spaceBtwItems,),                                 
            Text('+92-317-8059525' ,style: Theme.of(context).textTheme.bodyMedium,)
           
          ],
        ),

             Row(
          children: [
           const  Icon(Icons.location_history, color: Colors.grey, size: 16,) ,
            const SizedBox( width: TSizes.spaceBtwItems,),                                 
            Text('South Liana, Maine 87695, USA' ,style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)
           
          ],
        ),

      ],
    );
  }
}