import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies(){
    // we do not need to create the instance again and again
    Get.put(NetworkManager()); //Whenever these application will run it will automatically initiat the instance of Network Manager
   Get.put(VariationController()); 
  }
}