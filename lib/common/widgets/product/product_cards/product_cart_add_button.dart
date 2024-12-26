
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/product_deails.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductCartAddButton extends StatelessWidget {
   ProductCartAddButton({
    super.key, required this.product
  });
final ProductModel product;
final controller= CartController.instance;
  @override
  Widget build(BuildContext context) {
    return InkWell( 

      onTap: () {
        //If the product have variation then show the product details for variation selection.
        // Else add product to the cart.  
       if(product.productType==ProductType.single.toString()){
        final cartItem=controller.convertToCartItem(product, 1);
        controller.addOneToCart(cartItem);
       }       
       else{
         Get.to(()=>ProductDeails(product: product) );
       }

      } ,
      child: Obx(
        (){ 
          
          final productQuantity=controller.getProductQuantityInCart(product.id);
         return Container(
          decoration:  BoxDecoration(
            color: productQuantity>=1? TColors.primary:   TColors.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular( TSizes.cardRadiusMd),
              bottomRight: Radius.circular(TSizes.productImageRadius)
            )
          ),
          child:   SizedBox(
            height: TSizes.iconLg*1.2,
            width: TSizes.iconLg*1.2,
            child: productQuantity>=1? Center(child: Text(productQuantity.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white),))
            : const Icon(Iconsax.add,color: TColors.light ,),
          ),
        );
   } ),
    );
  }
}
