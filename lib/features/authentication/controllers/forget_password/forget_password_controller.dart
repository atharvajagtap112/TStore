import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration.dart/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance=>Get.find();

  final email=TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey=GlobalKey<FormState>();

   sendPasswordResetEmail() async{
    try{
      TFUILScreenLoader.openLoadingDialog('Processsing your request', TImages.docer);
        
        final isConnected=await NetworkManager.instance.isConnected();
        if(!isConnected){
           TFUILScreenLoader.stopLoading();
           return;
        }

         if(!forgetPasswordFormKey.currentState!.validate()){
            TFUILScreenLoader.stopLoading();
           return;
        }
     
       await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

       TFUILScreenLoader.stopLoading();

       TLoader.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);

       //Redirect
       Get.to(()=> ResetPasswordScreen(email: email.text.trim()));
    }
    catch(e){
        TFUILScreenLoader.stopLoading();
        TLoader.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
   }

   resendPasswordResetEmail(String email)async{
    try{
      TFUILScreenLoader.openLoadingDialog('Processsing your request', TImages.docer);
        
        //Check Internet Connectivity
        final isConnected=await NetworkManager.instance.isConnected();
        if(!isConnected){
           TFUILScreenLoader.stopLoading();
           return;
        }

        //Send Email to Reset Password
       await AuthenticationRepository.instance.sendPasswordResetEmail(email.trim());

      //remove Loader
       TFUILScreenLoader.stopLoading();
        
        //Show Success Screen
       TLoader.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);

     
    }
    catch(e){
        TFUILScreenLoader.stopLoading();
        TLoader.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
   }

}