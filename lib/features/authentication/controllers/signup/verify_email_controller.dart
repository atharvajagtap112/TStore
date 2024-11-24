import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/sucess_screen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
      static VerifyEmailController get Instance=>Get.find();
      
      // Send Email whenever Verify Screen appears & Set Timer for auto redirect.
      @override
  void onInit() {
    sendEmailVerifcation();
     setTimerForAutoRedirect();
    // TODO: implement onInit
    super.onInit();
  }
  sendEmailVerifcation()async{
    try{
     await AuthenticationRepository.instance.sendEmailVerification();
     TLoader.successSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify your email.');
    }
    catch(e){
      TLoader.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
  
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), 
     (timer) async {
         FirebaseAuth.instance.currentUser?.reload();
         final user=FirebaseAuth.instance.currentUser;
         if(user?.emailVerified ?? false){
            
             timer.cancel();
             Get.off(
              ()=> SucessScreen(
                image: TImages.successfullyRegisterAnimation,
                title: TTexts.yourAccountCreatedTitle, 
                subtitle: TTexts.changeYourPasswordSubTitle, 
                onPressed: ()=> AuthenticationRepository.instance.screenRedirect())
             );
         }

     }
    );
  }
  // Manually Check if Email is Verified 

  checkEmailVerificationStatus() async{
    final currentUser=FirebaseAuth.instance.currentUser;
    if(currentUser!=null&&currentUser.emailVerified) {
         Get.off(
              ()=> SucessScreen(
                image: TImages.successfullyRegisterAnimation,
                title: TTexts.yourAccountCreatedTitle, 
                subtitle: TTexts.changeYourPasswordSubTitle, 
                onPressed: ()=> AuthenticationRepository.instance.screenRedirect())
             );
    }
  }
}