import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/containers/TRoundedContainer.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/product/order_controller.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    final controller=OrderController();
    return FutureBuilder(
      future: controller.fetchUserOrders() ,
      builder: (context, snapshot) {
        //Nothing found Widget
        final emptyWidge= TAnimationLoaderWidget(
          text: 'Whoops! No Orders Yet!', 
          animation: TImages.orderCompletedAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: ()=> Get.to(()=> const NavigationMenu()),
          );
          
          // Helper Function: Handel Loader, No Record, OR ERROR Message
          final widget=CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot , nothingFound: emptyWidge);
           if(widget!=null) return widget;
          
         // Congratulations Record found 
       final orders=snapshot.data!;
        return ListView.separated( 
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, __) => const SizedBox( height: TSizes.spaceBtwItems,),
          itemBuilder: (_, index) { 
            
             return TRoundedContainer(
            showBorder: true,
            padding:const EdgeInsets.all(TSizes.md),
            backgroundColor: dark? TColors.dark :TColors.light,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Row 1
                Row(
                  children: [
                    // 1 Icon 
                   const Icon(Iconsax.ship),
                   const SizedBox( width: TSizes.spaceBtwItems/2,),
                 
                   // 2 Status & Date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(orders[index].orderStatusText, style:Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1 //These reduce the size
                          ) ,),
                          Text(orders[index].formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall,)
                        ],
                      ),
                    ),
                    // 3 Icon
                    IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34 ,size: TSizes.iconSm,), )
                  ],
                ),
          
                const SizedBox(height: TSizes.spaceBtwItems,),
          
                // Row 2
                      Row(
          
                        children: [
                          Expanded(
                            child: Row(
                                        children: [
                                          // 1 Icon 
                                         const Icon(Iconsax.tag),
                                         const SizedBox( width: TSizes.spaceBtwItems/2,),
                                       
                                         // 2 Status & Date
                                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Order', style:Theme.of(context).textTheme.labelMedium),
                                Text(orders[index].id, style: Theme.of(context).textTheme.titleMedium,)
                              ],
                            ),
                                          ),
                                     
                                        
                                        ],
                                      ),
                          ), 
          
                           Expanded(
                            child: Row(
                                        children: [
                                          // 1 Icon 
                                         const Icon(Iconsax.calendar),
                                         const SizedBox( width: TSizes.spaceBtwItems/2,),
                                       
                                         // 2 Status & Date
                                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Shipping Date', style:Theme.of(context).textTheme.labelMedium),
                                Text(orders[index].formattedDeliveryDate, style: Theme.of(context).textTheme.titleMedium,)
                              ],
                            ),
                                          ),
                                     
                                        
                                        ],
                                      ),
                          ),
                          
                        ],
                      ),
          
          
              ],
            ),
          ); }
        );
      }
    );
  }
}