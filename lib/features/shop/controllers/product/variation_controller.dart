import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/images_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController{ 
  static VariationController get instance=> Get.find();
  /// Variables  
  RxMap selectedAttribute ={}.obs;
  RxString varitionStockStatus=''.obs;
  Rx<ProductVariationModel> selectedVariation=ProductVariationModel.empty().obs;
 
 void onAttributeSelected(ProductModel product, attributeName, attributeValue){
  print(' name Attri $attributeName    valueeeeee $attributeValue ');
  // when attribute is selected we will first add that attribute to the selectedAttributes
  final selectedAtrribute=Map<String, dynamic>.from(selectedAttribute) ;
  selectedAtrribute[attributeName]=attributeValue;
  selectedAttribute[attributeName]=attributeValue;

  final selectedVariation =product.productVariations!.firstWhere(// only store one variation
     (variation) =>_isSameAttributeValues(variation.attributeValues, selectedAtrribute),
     orElse: ()=> ProductVariationModel.empty()
);
    
      if(selectedVariation.image.isNotEmpty){
        ImagesController.instance.selectedProductImage.value=selectedVariation.image;
      }
    /* variation will have the Map of Attribute Value 
   
    ProductVariation  and  selectedAtrribute
    {                       {
    Colors: "Green"         Colors: "Green"
    Size:"Eu 34"             Size:"Eu 34"
    }                         }
    
   if there length and value are same we will return true and the entire Product variation data will store in selected variation   */
     
      
   final controller=CartController.instance;
   controller.productQuantityInCart.value=controller.getVariationQuantityInCart(product.id, selectedVariation.id);


     this.selectedVariation.value=selectedVariation;
     print('  Color          ${selectedVariation.attributeValues['Color']} ');
      print('  Size     ${selectedVariation.attributeValues['Size']}');
     getProductVariationStockStatus();
 }



 bool _isSameAttributeValues( Map<String ,dynamic> variationAtrribute, Map<String ,dynamic> selectedAttribute ){
   // If selectedAttribute contains 3 and current variation contains 2 then return.
   if(variationAtrribute.length!=selectedAttribute.length) return false;

   //If any of the attribute is different then return e.g [Green, Large] x [Green, Small]
   for (final key in variationAtrribute.keys ){
    // Attribute[key] ==value which could be [Green, small , Cotton] etc.
      if(variationAtrribute[key]!= selectedAttribute[key] ) return false;
   }

return true;
 }
   // -- Check Attribute availability / Stock in variation
   Set<String?> getAttributesAvailabilityInVarition( List<ProductVariationModel> variation, String attributeName){
       // for ex attribute name = colors  
       // the where will store all the variation form variations List whose stock is >0 
       // after that map will just store the list of colors or size depends on attribute name
       //these will store set of colors and then will just check if the variation colors contain in set or not
             
       // Pass the variations to check which attributes are available and stock is not 0 
       final availableVaritionAttributeValues= variation
       .where( (variation)=>
               // Check Empty / Out of Stock Attributes
               //Store only variation who has stock
              variation.attributeValues[attributeName]!=null && variation.attributeValues[attributeName]!.isNotEmpty &&
               variation.stock>0)
             //Fetch all non-empty attributes of variations
            //these will have all the list of productVariation Model
            // now we want ex [red, blue , green]
             // just store the Arttribut value value by name ex name=color 
             //get just color from all list of product variation
        //now we just have avalable product now we can compare the if the product in all variation list is it has all variation list
        //  if these list which we are returning these list values contain in the main list if it is then we will mark
        //true that is not null to on presss   
              .map((variation)=>variation.attributeValues[attributeName] )
              .toSet();

         return availableVaritionAttributeValues;     
   }

 void getProductVariationStockStatus(){
   varitionStockStatus.value=selectedVariation.value.stock>0 ? 'In Stock' : 'Out of Stock';
 }
  

  // Reset Selected Attribute when switching product 
void resetSelectedAttribute(){
  selectedAttribute.clear();
  varitionStockStatus.value="";
  selectedVariation.value=ProductVariationModel.empty();
}

String getVariationPrice(){
  return (selectedVariation.value.salePrice>0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
}

}