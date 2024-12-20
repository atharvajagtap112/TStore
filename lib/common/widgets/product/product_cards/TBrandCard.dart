import 'package:flutter/material.dart';

import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';

import 'package:t_store/common/widgets/image/t_circular_image.dart';

import 'package:t_store/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_function.dart';
class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.ShowBorder, this.onTap, required this.brand, 
  });
  final BrandModel brand;
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
                                      isNetworkImage: true,
                                    image: brand.image,
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
                         TBrandTitlewithVerifiedIcon(
                          title: brand.name,
                          brandTextSize: TextSizes.large,
                        ),
                        Text(
                          '${brand.productCount?? 0} Products',
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
