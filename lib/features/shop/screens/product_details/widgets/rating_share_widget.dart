import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/review_controller.dart';

import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';


class Rating_Share_Widget extends StatelessWidget {
  const Rating_Share_Widget({
    super.key, this.productId,
  });
final productId;
  @override
  Widget build(BuildContext context) {
    final controller=ReviewController.instance;
   
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
            children: [
              const Icon(Iconsax.star5,color: Colors.amber, size: 24,),
              const SizedBox( width: TSizes.spaceBtwItems/2 ,),
             
              FutureBuilder(
                future: controller.getReviewsOfProducts(productId),
                builder: (context, snapshot) {
              final widget=    CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: Text('No reviews yet'));
                  if(widget!=null) return widget;
                   
                  return Text.rich(
                    TextSpan( 
                            children: [
                              TextSpan(text:controller.averageRating(snapshot.data!).toString() ,style: Theme.of(context).textTheme.bodyLarge),
                               TextSpan(text: '(${snapshot.data!.length})')
                            ]
                      
                    )
                  );
                }
              )
            ],
      ),
      //Share Button
      IconButton(onPressed: (){},icon:const Icon(Icons.share, size: TSizes.iconMd,))
      
      ],
    );
  }
}

