import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/brands/brands_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';

class BrandController extends GetxController {
 static BrandController get instance => Get.find();

  RxList<BrandModel> featuredBrand=<BrandModel>[].obs;
  RxList<BrandModel> allBrands=<BrandModel>[].obs;
  RxBool isLoading=false.obs; 
       final brandRepository=Get.put(BrandRepository());
     
     @override
       void onInit(){
        getFeaturedBrands();
    super.onInit();

       }

  // Load Brands
  Future<void> getFeaturedBrands() async{
     try{ isLoading.value=true;
          final allBrandsList= await brandRepository.getAllBrands();
               allBrands.assignAll(allBrandsList);
                  featuredBrand.assignAll(allBrandsList.where((brands)=>brands.isFeatured==true ).toList());
 
     } catch(e){
      TLoader.errorSnackBar(title: 'OhSnap' , message: e.toString());
     } finally{
      isLoading.value=false;
     }

  }  

  Future<List<BrandModel>> getBrandsForCategory( String categoryId ) async{
       try{
           
          final brands=brandRepository.getBrandsForPerticularCategoryId(categoryId);
          return brands;
       }
        catch(e){
      TLoader.errorSnackBar(title: 'OhSnap' , message: e.toString());
      return [];
     } 
  }


  // Get Brands specific products form your data source
  Future<List<ProductModel>> getBrandProducts({ required String brandId , int limit =-1}) async{
       try{
       final products= await ProductRepository.instance.getProductsForBrands(brandId: brandId, limit: limit);
       return products;
       } 
       catch(e){
      TLoader.errorSnackBar(title: 'OhSnap' , message: e.toString());
      return [];
     } 
  }
                                
}