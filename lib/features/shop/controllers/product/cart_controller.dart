import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/features/shop/models/cart_item_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class CartController extends GetxController {
 static CartController get instance => Get.find();
  
  // Variation 
  RxInt noOfCartItems=0.obs;
  RxDouble totalCartPrice=0.0.obs;
  RxInt productQuantityInCart=0.obs;
  RxList<CartItemModel> cartItems=<CartItemModel>[].obs;
  final variationController=VariationController.instance; // these will have the current data of selected variation 
  RxDouble originalPrice=0.0.obs;  
   CartController(){
    loadCartItems();
   } 
 
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
      TLoader.customToast(message: 'Your Product has been added to the Cart');
    updateCart();


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
 
 //update Cart
  void updateCart(){
    updateCartTotal(); 
    saveCartItems();
    cartItems.refresh();

  }

  void updateCartTotal(){
    double calculateTotalPrice=0.0;
    int calculateNoOfItems=0;

    for(var item in cartItems){
      calculateTotalPrice+=(item.price)*item.quantity.toDouble();
      calculateNoOfItems+=item.quantity;

    } totalCartPrice.value=calculateTotalPrice;
     noOfCartItems.value=calculateNoOfItems;
  }                       
   

  void saveCartItems(){
   final cartItemString = cartItems.map((item)=>item.toJson() ).toList();
   TLocalStorage.instance().saveData('cartItems', cartItemString);


  } 

  void loadCartItems(){
  final cartItemsStrings =  TLocalStorage.instance().readData<List<dynamic>>('cartItems');
 
  if(cartItemsStrings!=null){
     cartItems.addAll( cartItemsStrings.map((item)=> CartItemModel.fromJson(item as Map<String, dynamic> )) );
     updateCartTotal();
  }
  
  }

  int getProductQuantityInCart(String productId){
    final foundItem= 
    cartItems.where((item)=> item.productId==productId).fold(0, (previousValue, element) => previousValue+element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId){
     final foundItem=cartItems.firstWhere( 
      (item) => item.productId==productId&& item.variationId==variationId,
      orElse:()=> CartItemModel.empty()
     ) ;

     return foundItem.quantity;
  }

  void clearCart(){
    productQuantityInCart.value=0;
    cartItems.clear();
    updateCart();
  }


  void addOneToCart( CartItemModel item ){
  final index=   cartItems.indexWhere((cartItem)=> cartItem.productId==item.productId&& cartItem.variationId== item.variationId);
     if(index>=0){
      cartItems[index].quantity+=1;
     }
     else{
      cartItems.add(item);
     }
     updateCart();
  
  }


  void removeOneItem( CartItemModel item ){
final index=   cartItems.indexWhere(
              (cartItem)=> cartItem.productId==item.productId&& cartItem.variationId== item.variationId);  
                         
  if(index>=0){
    if(cartItems[index].quantity>1){
      cartItems[index].quantity-=1;
    }
    else{
      cartItems[index].quantity==1? removeFromCartDialog(index): cartItems.removeAt(index);
    }
    updateCart();
  }  }
  
 
 
  removeFromCartDialog( int index) {
      Get.defaultDialog(
       title: 'Remove Product',
       middleText: 'Are you sure you want to remove this product',
       onConfirm: (){
        cartItems.removeAt(index);
        updateCart();
        TLoader.customToast(message: 'Product removed from the cart');
        Get.back();
       },
       onCancel: () => Get.back(),);
  }

// Initialize already added item's count in the cart.
void updateAlreadyAddedProductCount(ProductModel product) {
  // If the product has no variations, then calculate cart entries and display total number.
  // Else make default entries to 0 and show cart entries when variation is selected.
  if (product.productType == ProductType.single.toString()) {
    productQuantityInCart.value = getProductQuantityInCart(product.id);
  } else {
    // Get selected variation, if any...
    final variationId = variationController.selectedVariation.value.id;
    if (variationId.isNotEmpty) {
      productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
    } else {
      productQuantityInCart.value = 0;
    }
  }
}

   void updatePriceWithDiscount(double discountAmount) {
    print(discountAmount);
    // Store original price if not already stored
    final originalPrice = totalCartPrice.value + discountAmount;
    print( totalCartPrice.value);
    totalCartPrice.value = totalCartPrice.value - discountAmount;
    print("-----------------------------------------------------------");
    print( totalCartPrice.value);

  }


}