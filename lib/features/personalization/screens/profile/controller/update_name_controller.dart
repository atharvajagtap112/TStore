import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class UpdateNameControler extends GetxController{
 UpdateNameControler get instance=>Get.find();

 final firstName=TextEditingController();
 final lastName=TextEditingController();
 GlobalKey<FormState> updateFormKey=GlobalKey<FormState>();
 final userController= UserController.instance;
  final userRepository=Get.put(UserRepository());
 @override
  void onInit(){
    
  initialzeNames();
  super.onInit();
  }
  
 Future<void> initialzeNames() async{
    firstName.text= userController.user.value.firstName;
    lastName.text=userController.user.value.lastName;
 }
Future<void> updateUserName() async{
 TFUILScreenLoader.openLoadingDialog('We are updating your information', TImages.docer);

 final isConnected=await NetworkManager.instance.isConnected();
 if(!isConnected){
  TFUILScreenLoader.stopLoading();
  return;
}

Map<String,dynamic> name={'FirstName': firstName.text.trim() , 'LastName': lastName.text.trim()};
await userRepository.updateSingleField(name);
 
 // Remove Loader
 TFUILScreenLoader.stopLoading();

 TLoader.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated');
}

}