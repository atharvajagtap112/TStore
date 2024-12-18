import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';

class Allproductscontroller extends GetxController {
  static Allproductscontroller get instance=>Get.find();
   final repository=ProductRepository.instance;
   final RxBool isLoading=false.obs;
      RxString sortValue=''.obs;
   List<ProductModel> product=<ProductModel>[].obs;

   void sortProducts(String sortOptions){
      sortValue.value=sortOptions;
    switch (sortOptions){
      case 'Name' :
       product.sort((a,b)=> a.title.compareTo(b.title));
       break;

       case 'Higher Price' :
       product.sort((a,b)=> b.price.compareTo(a.price));
       break;

       case 'Lower Price' :
       product.sort((a,b)=> a.title.compareTo(b.title));
       break;

       case 'Newest' :
       product.sort((a,b)=> a.date!.compareTo(b.date!));
       break;

       case 'Sale' :
        product.sort((a,b) {
          if(b.salePrice>0){return b.salePrice.compareTo(a.salePrice);} 
          else if(a.salePrice>0)  {return -1;}  
          else {return 1;}
        }
        );
       break;
         default:
        product.sort((a,b)=> a.title.compareTo(b.title));
     
       
    }
   }  

  
  Future<List<ProductModel>> fetchProductsByQuery( Query query) async{
      try{
        isLoading.value=true;
        final products=await repository.getProductsByQuery(query);
        return products;
      }
      catch(e){
        TLoader.errorSnackBar(title: 'OhSnap', message: e.toString());
        return [];
      } 
      finally{
        isLoading.value;
      }
  } 
  
  void assingToList (List<ProductModel> product1 ){
      
       
       product.assignAll(product1);
       sortValue('Name');
  }

  }