import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/banners/banners_repositories.dart';

import 'package:t_store/features/shop/models/banner_model.dart';

class BannerController extends GetxController {
 static BannerController get instance=> Get.find();
    RxList<BannerModel> bannerList =<BannerModel>[].obs;
    RxBool isLoading=false.obs;
      final carousalCurrentIndex=0.obs;
    final bannerRepository=Get.put(BannersRepositories());
    
    @override
      onInit(){
        fetchData();
    super.onInit();
  
      
    }
    
   void updatePageIndex(index){
    carousalCurrentIndex.value=index;}
    Future<void> fetchData() async{
      try{
       isLoading.value=true;
      final list  = await bannerRepository.fetchBanners();
      bannerList.assignAll(list);
      }
    
     catch(e){
     TLoader.errorSnackBar(title: 'OhSnap', message: e.toString());
    }
    finally{
      isLoading.value=false;
    }
    }
}