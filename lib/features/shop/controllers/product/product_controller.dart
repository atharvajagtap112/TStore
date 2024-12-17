import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';

class ProductController extends GetxController{
   static ProductController get instance=>Get.find();
   
   final isLoading=false.obs;
    RxList<ProductModel> featuredProduct=<ProductModel>[].obs;
   final productRepository=Get.put(ProductRepository());

   @override
  void onInit() {
fetchProducts();
    // TODO: implement onInit
    super.onInit();
  }  

  Future<void> fetchProducts() async{
    try{
           isLoading.value=true;
           final list= await productRepository.getFeaturedProduct();
           featuredProduct.assignAll(list);
           isLoading.value=false;
    } catch(e){
      TLoader.errorSnackBar(title: 'ohSnap', message: e.toString());
    }
  }
    
    String getProductPrice(ProductModel product){

      double smallestPrice=double.infinity;
      double largestPrice=0;
      // If no variation exist, return the simple price or sale price 
      if(ProductType.single.toString()==product.productType){
        return (product.salePrice>0? product.salePrice:product.price).toString();
      }
      
      for(var variation in product.productVariations!){
        //Determine the price to consider (sale price if available, otherwise regular price)
           double priceToConsider=variation.salePrice>0? variation.salePrice:variation.price;
            
           if(priceToConsider<smallestPrice){
            smallestPrice=priceToConsider;
           }
           if(priceToConsider> largestPrice) largestPrice=priceToConsider;

         
      }
      if(smallestPrice.isEqual(largestPrice)) return largestPrice.toString();
      return '$smallestPrice - \$$largestPrice';
    }

    String? calculateSalePercentage(double orignalPrice, double?  salePrice){
      if(salePrice ==null|| salePrice<=0) return null;
      if(orignalPrice<=0) return null;
       double percentage =((orignalPrice-salePrice)/orignalPrice)* 100; 
       return percentage.toStringAsFixed(0);//fixed number
    }

    String getProductStock(int stock){
      return stock >0? 'In Stock' :'Out of Stock';
    }
}