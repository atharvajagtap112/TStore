import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/common/widgets/list_tiles/setting_menu_tilte.dart';
import 'package:t_store/data/repositories/banners/banners_repositories.dart';
import 'package:t_store/data/repositories/brands/brands_repository.dart';
import 'package:t_store/data/repositories/categories/categories_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/t_dummy_data.dart';

class UploadData extends StatelessWidget {
  const UploadData({super.key});
 
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CategoriesRepository());
    final bannerController2=BannersRepositories.instance;
    final brandRepository=Get.put(BrandRepository());
    return Scaffold(
      appBar:const  TAppBar(  title: Text('Upload Data'),showBackArrow: true,),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text('Main Record', style: Theme.of(context).textTheme.headlineMedium,), 
             TSettingMenuTile(icon: Iconsax.grid_1, title: 'Upload Categories' , onTap: ()=>controller.uploadDummyData(TDummyData.categories)),
              TSettingMenuTile(icon: Iconsax.grid_1, title: 'Upload Banners' , onTap: ()=>bannerController2.uploadDummyData(TDummyData.banners)),
              TSettingMenuTile(icon: Iconsax.grid_1, title: 'Upload Products' , onTap: ()=>ProductRepository.instance.uploadDummyData(TDummyData.products)),  
              TSettingMenuTile(icon: Iconsax.grid_1, title: 'Upload Brands' , onTap: ()=>brandRepository.uploadDummyData(TDummyData.brands)),        
                     ],
        ),
      ),
    );
  }
}