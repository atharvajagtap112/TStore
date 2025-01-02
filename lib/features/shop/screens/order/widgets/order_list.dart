import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/product/order_controller.dart';
import 'package:t_store/features/shop/screens/product_reviews/add_review_screen.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OrderController();
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (context, snapshot) {
        final emptyWidge = TAnimationLoaderWidget(
          text: 'Whoops! No Orders Yet!',
          animation: TImages.orderCompletedAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.to(() => const NavigationMenu()),
        );

        final widget = CloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, nothingFound: emptyWidge);
        if (widget != null) return widget;

        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, __) => const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          itemBuilder: (_, index) {
            final order = orders[index];
            return TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row 1
                  Row(
                    children: [
                      const Icon(Iconsax.ship),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(color: TColors.primary, fontWeightDelta: 1),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: TSizes.iconSm,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Row 2
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.tag),
                            const SizedBox(width: TSizes.spaceBtwItems / 2),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Order',
                                      style: Theme.of(context).textTheme.labelMedium),
                                  Text(order.id,
                                      style: Theme.of(context).textTheme.titleMedium)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: TSizes.spaceBtwItems / 2),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Shipping Date',
                                      style: Theme.of(context).textTheme.labelMedium),
                                  Text(order.formattedDeliveryDate,
                                      style: Theme.of(context).textTheme.titleMedium)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  // Products Row - Only show for delivered orders
                  if (order.status == OrderStatus.delivered) ...[
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivered Items',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'Add Review',
                          style: Theme.of(context).textTheme.labelMedium?.apply(
                            color: TColors.primary,
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    //Displaying products  in horizontal order
                    
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: order.items.length,
                        separatorBuilder: (context, index) => 
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                        itemBuilder: (context, itemIndex) {
                          final item = order.items[itemIndex];
                          print("--------------------------------------------------------");
                          print(item.productId);
                          return GestureDetector(
                            onTap: () => Get.to(() => AddReviewScreen(
                             productId: item.productId,
                            )),
                            child: TRoundedContainer(
                              width: 100,
                              padding: const EdgeInsets.all(TSizes.sm),
                              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product Image
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(TSizes.sm),
                                      child: Image.network(
                                        item.image ?? '',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) =>
                                            const Icon(Iconsax.image),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                                  // Product Title
                                  Text(
                                    item.title,
                                    style: Theme.of(context).textTheme.labelMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // Product Quantity
                                  Text(
                                    'x${item.quantity}',
                                    style: Theme.of(context).textTheme.labelSmall?.apply(
                                      color: TColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}