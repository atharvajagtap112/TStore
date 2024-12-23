import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance=> Get.find();
 
 // Variables
 final favorites=<String, bool>{}.obs;
 
 @override
  void onInit() {
    fetchFavorites();
    // TODO: implement onInit
    super.onInit();
  }

  void fetchFavorites(){
      //data will be in the form of the json
        final json =TLocalStorage.instance().readData('favorites');
        if(json!=null ){
       final storeFavorite =jsonDecode(json) as Map<String,dynamic>;
       favorites.addAll(storeFavorite.map((key , value)=> MapEntry(key, value as bool) )); 
        }}

  bool isFavorite(String productId ){
  return favorites[productId] ?? false;
  }
  
  void toggleFavoriteProduct(String productId){
    if(!favorites.containsKey(productId)){
      favorites[productId]=true;
     saveFavoritesToStorage();
     TLoader.customToast(message: 'Products has been added to the Wishlist.');

    }else{
      TLocalStorage.instance().removeData(productId);
        saveFavoritesToStorage();
        favorites.remove(productId);
        favorites.refresh();
        TLoader.customToast(message: 'Products has been removed from the Wishlist.');
    }
  }


   void saveFavoritesToStorage(){
    final encodedfavorite=jsonEncode(favorites);
    TLocalStorage.instance().saveData('Favorites', encodedfavorite);
   }

   Future<List<ProductModel>> favoritesProducts() async{
      return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
   }
}