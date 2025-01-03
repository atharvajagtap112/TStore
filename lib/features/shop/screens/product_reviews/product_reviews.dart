
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/product/Rating/rating_indicator.dart';
import 'package:t_store/features/shop/controllers/review_controller.dart';
import 'package:t_store/features/shop/models/review_model.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_review_images.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key, required this.reviewModleList});

  final List<ReviewModel> reviewModleList;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews & Rating'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating and reviews are verified.'),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Overall Product Rating
            OverallProductRating(list: reviewModleList),
            TRatingBarIndicator(rating: controller.avgRating.value),
            Text(
              reviewModleList.length.toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Customer Images Section
            ProductReviewImages(reviewModelList: reviewModleList),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Review List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reviewModleList.length,
              itemBuilder: (context, index) {
                return UserReviewCard(review: reviewModleList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

