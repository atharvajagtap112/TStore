import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/product/Rating/rating_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return 
      Column(
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar( backgroundImage: AssetImage(TImages.userProfileImage1),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('John Doe',style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon:  const Icon(Icons.more_vert))
          ],
         ),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Row(
            children: [
              const TRatingBarIndicator(rating: 4,),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text('01 Nov, 2024',style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),
          const ReadMoreText( 
            'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job! ',
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimExpandedText: 'show less',
            trimCollapsedText: 'show more',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
            
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),

          TRoundedContainer(
            backgroundColor: dark? TColors.darkerGrey:TColors.grey,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("T's Store", style: Theme.of(context).textTheme.titleMedium,),
                      Text('02 Nov, 2024',style: Theme.of(context).textTheme.bodyMedium,),
                    ],
 ),
                         const ReadMoreText( 
            'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job! ',
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimExpandedText: 'show less',
            trimCollapsedText: 'show more',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
            
          ),
                    
                ],
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections,)
 

        ],
      
      );
  }
}