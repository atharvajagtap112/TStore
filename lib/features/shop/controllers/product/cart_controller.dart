import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';

class CartController extends GetxController {
 static CartController get instance => Get.find();
  
  // Variation 
  RxInt noOfProducts=0.obs;
  RxDouble totalCartPrice=0.0.obs;
  RxInt productQuantityInCart=0.obs;
  RxList<CartItemModel> cartItems=<CartItemModel>[].obs;
  final variationController=VariationController.instance; // these will have the current data of selected variation 

  void addTocart(ProductModel product){
    // Quantity Check
    if(productQuantityInCart.value<0) {
      TLoader.customToast(message: 'Select Quantity');
      return ;
    }
     
     // Variation Selected
    if(product.productType==ProductType.variable.toString()&& variationController.selectedVariation.value.id.isEmpty){
      TLoader.customToast(message: 'Select Variation');
      return ;
    }
     
     //Out of stock status
     if(product.productType==ProductType.variable.toString() && variationController.selectedVariation.value.stock<1){
      TLoader.warningSnackBar(title:'Oh Snap!', message:'Selected variation is out of stock.' );
      return ;
     }else{
      if(product.stock<1){
        TLoader.warningSnackBar(title:'Oh Snap!', message:'Selected variation is out of stock.' );
      return ;
      }
     }
        
       final selectedCartItem=convertToCartItem(product, productQuantityInCart.value); 
      // Check if already added in the cart
      
      final index =cartItems.indexWhere(
        (cartItem)=> cartItem.productId==selectedCartItem.productId&& cartItem.variationId==selectedCartItem.variationId); 

     if(index>=0) {
      // This quantity is already added or Updated/removed form the design (Cart)(-)
      cartItems[index].quantity=selectedCartItem.quantity;
     }else{
      cartItems.add(selectedCartItem);
     }   



  }
 
 //convert the product in to cart model
  CartItemModel convertToCartItem(ProductModel product, int quantity){
    if(product.productType==ProductType.single.toString()){
        //Reset Variation in case of single variation so we did not need to add if else condition
        // for the single and variation product to store in the category
        variationController.resetSelectedAttribute(); 
    }

    final variation=variationController.selectedVariation.value;
    final isVariation=variation.id.isNotEmpty;
    final price=isVariation
                           ? variation.salePrice>0 ? variation.salePrice :variation.price
                           : product.salePrice>0 ? product.salePrice: product.price;
 
  return CartItemModel(
    productId: product.id, 
    quantity: quantity,
    brandName: product.brand!=null? product.brand!.name: "", 
    price: price,
    image: isVariation? variation.image: product.thumbnail,
    title: product.title,
    selectedVariation: isVariation? variation.attributeValues:null,
    variationId: variation.id

    
    );
   
  }                       

}