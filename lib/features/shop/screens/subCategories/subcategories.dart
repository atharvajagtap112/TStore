import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/image/t_rounded_image.dart';
import 'package:t_store/common/widgets/loaders/THorizontalProductShimmer.dart';
import 'package:t_store/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/features/personalization/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/All_product/All_Product.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';
class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text(category.name ?? 'Category'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TRoundedImage(
                imageUrl: TImages.banner3,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Subcategories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  const loader = THorizontalProductShimmer();
                  final widget = CloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) return widget;

                  // Ensure snapshot has valid data
                  final subCategories = snapshot.data ?? [];
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subCategories.length,
                    itemBuilder: (context, index) {
                      final subCategory = subCategories[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TSelectionHeading(
                            title: subCategory.name ?? 'Unnamed Category',
                            onPressed: () {
                              Get.to(() {
                                return AllProducts( title:subCategory.name ,
                                  futureMethodList: controller.getCategoryProducts(
                                    categoryId: subCategory.id,
                                    limit: 4,
                                  ),
                                );
                              });
                            },
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),

                          /// Products in Subcategory
                          SizedBox(
                            height: 120, // Fixed height for horizontal list
                            child: FutureBuilder(
                              future: controller.getCategoryProducts(
                                categoryId: subCategory.id,
                                limit: 4,
                              ),
                              builder: (context, snapshot) {
                                final widget =
                                    CloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot,
                                  loader: loader,
                                );
                                if (widget != null) return widget;

                                // Ensure products data is valid
                                final products = snapshot.data ?? [];
                                return ListView.separated(
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(width: TSizes.spaceBtwItems),
                                  itemBuilder: (context, index) {
                                    final product = products[index];
                                    return TProductCardHorziontal(
                                      product: product,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwSections),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
