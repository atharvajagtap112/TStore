import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/TGridLayout.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/loaders/t_shimmerLoader.dart';
class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return SizedBox(
      height: 150, // Define a fixed height for the horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (_, __) => Container(
          width: 310,
          margin: const EdgeInsets.only(right: TSizes.sm),
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? Colors.grey[800] : Colors.grey[300],
          ),
          child: Row(
            children: [
              // Image Container
              Container(
                height: 120,
                width: 120,
                padding: const EdgeInsets.all(TSizes.sm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(TSizes.productImageRadius),
                  color: dark ? Colors.grey[700] : Colors.grey[100],
                ),
                child: const TShimmerEffect(width: 120, height: 120),
              ),
              const SizedBox(width: TSizes.sm),

              // Text and Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const TShimmerEffect(width: 150, height: 15),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    // Brand
                    const TShimmerEffect(width: 100, height: 12),
                    const Spacer(),

                    // Price and Add Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TShimmerEffect(width: 80, height: 12),
                            SizedBox(height: TSizes.xs),
                            TShimmerEffect(width: 100, height: 14),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.productImageRadius),
                            ),
                          ),
                          child: const SizedBox(
                            height: TSizes.iconLg * 1.2,
                            width: TSizes.iconLg * 1.2,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
