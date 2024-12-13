import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/categories/categories_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance=> Get.find();
   final _categoriesRepository=Get.put(CategoriesRepository());
    RxList<CategoryModel> allCategories=<CategoryModel>[].obs;
    RxList<CategoryModel> featuredCategories=<CategoryModel>[].obs;
   final RxBool isLoading=false.obs;
  @override
  void onInit() {
    fetchCategories();
    // TODO: implement onInit
    super.onInit();
            
  }
   
   Future<void> fetchCategories() async{ 
      try{
        isLoading.value=true;
        final categories=await _categoriesRepository.getAllCategories();
        allCategories.assignAll(categories); 
         
        featuredCategories.addAll(categories.where((category)=>category.isFeatured&&category.parentId.isEmpty ).take(8).toList()); 
        
      }
      catch(e) {
       TLoader.errorSnackBar(title: 'Oh Snap!' , message: e.toString());
      }finally{
        isLoading.value=false;
      }
   }


}