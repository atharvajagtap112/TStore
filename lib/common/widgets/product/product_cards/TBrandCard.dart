import 'package:flutter/material.dart';

import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';

import 'package:t_store/common/widgets/image/t_circular_image.dart';

import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';
class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.ShowBorder, this.onTap,
  });

final bool ShowBorder;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: onTap,
      child: TRoundedContainer(
    padding:  const EdgeInsets.all(TSizes.sm),
      backgroundColor: Colors.transparent,
                                 showBorder: ShowBorder,
                                 child: Row(
                                   children: [
                                       /// Icon
                                       Flexible( // adjust itself
                                     child: TCircularImage(
                                      isNetworkImage: false,
                                    image: TImages.clothIcon,
                                      backgroundColor: Colors.transparent,
                                        overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                                     ),
                                           )      ,                                                       
                  const SizedBox(width: TSizes.spaceBtwItems / 2),
          
                  /// Text
                  Expanded(
                    child: Column(
                      mainAxisSize:MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children: [
                        const TBrandTitlewithVerifiedIcon(
                          title: 'Nike',
                          brandTextSize: TextSizes.large,
                        ),
                        Text(
                          '256 products',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
     
          );
  }
}
