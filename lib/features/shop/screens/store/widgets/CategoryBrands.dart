import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_show_case.dart';
import 'package:t_store/common/widgets/loaders/boxes_shimmer.dart';
import 'package:t_store/common/widgets/loaders/list_tile_shimmer.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(categoryId:  category.id, limit: 4),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            TListTileShimmer(),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TBoxesShimmer(),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          ],
        );

        final Widget =
            CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if (Widget != null) return Widget;

        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                final widget = CloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                //if (widget != null) return widget;

                final products = snapshot.data!;
                return TBrandShowCase(
                  images: products.map((product) => product.thumbnail!).toList(),
                  brand: brand,
                );
              },
            );
          },
        );
      },
    );
  }
}
