// add_review_screen.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/features/shop/controllers/review_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key, required this.productId});
   final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());

    return Scaffold(
      appBar: TAppBar(
        title: Text('Write a Review', 
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  'Rate this Product',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                
                // Rating Bar
                Center(
                  child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) => controller.rating.value = value,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Review Text Field
                TextFormField(
                  controller: controller.reviewTextController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Write your review here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your review';
                    }
                    if (value.length < 10) {
                      return 'Review must be at least 10 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Image Upload Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Photos (Optional)',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Obx(() => controller.selectedImagePath.value.isEmpty
                      ? GestureDetector(
                          onTap: controller.pickImage,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                            ),
                            child: const Icon(
                              Iconsax.image,
                              size: 32,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                                image: DecorationImage(
                                  image: FileImage(File(controller.selectedImagePath.value)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: IconButton(
                                onPressed: controller.removeImage,
                                icon: const Icon(Icons.close, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Submit Button
                Obx(() => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value ? (){} :()=> controller.submitReview(productId),
                    child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Submit Review'),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}