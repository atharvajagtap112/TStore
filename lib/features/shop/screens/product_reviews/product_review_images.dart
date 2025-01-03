
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/product/Rating/rating_indicator.dart';
import 'package:t_store/features/shop/controllers/review_controller.dart';
import 'package:t_store/features/shop/models/review_model.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviewImages extends StatelessWidget {
  final List<ReviewModel> reviewModelList;

  const ProductReviewImages({
    Key? key,
    required this.reviewModelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter reviews that have product images
    final reviewsWithImages = reviewModelList
        .where((review) => review.productImage.isNotEmpty)
        .toList();

    // If no images, return empty container
    if (reviewsWithImages.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Customer Images'),
        const SizedBox(height: TSizes.spaceBtwItems),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reviewsWithImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: TSizes.defaultSpace / 2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                    child: Image.network(
                      reviewsWithImages[index].productImage,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          width: 100,
                          height: 100,
                          child: Icon(Icons.error_outline),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}