import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/common/widgets/text/TProductTitleText.dart';
import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TCardItems extends StatelessWidget {
  const TCardItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
        TRoundedImage(
            width: 60,
            height: 60, 
            padding:const EdgeInsets.all(TSizes.sm), 
            imageUrl: TImages.productImage1,
            backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkerGrey:TColors.light
            
       ),
       const SizedBox(width: TSizes.spaceBtwItems,),
       Expanded(
         child:  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TBrandTitlewithVerifiedIcon(title: 'Nike',),
          const Flexible (child:   TProductTitleText(text: 'Black Sports shoes dvxfgdfgfsdgsfdgfffdhdfhdfhfdshdfhfdfd',maxLines: 1,)),
            
            //Attributes
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Colors ',style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'Green ',style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: 'Sizes ',style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'UK 08 ' ,style: Theme.of(context).textTheme.bodyLarge),
                ]
              )
            )
    
          ],
         ),
       )
       ],
    );
  }
}