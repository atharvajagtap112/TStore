import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/firebase_exceptions_and_user_model.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  
 static SignupController get instance => Get.find();

 final privacyPolicy=false.obs;
 final hidePassword=true.obs; // obs means turn these variable to observer variable to observ by widgets
 final email =TextEditingController();
 final lastName =TextEditingController();
 final username =TextEditingController();
 final password =TextEditingController();
 final firstName =TextEditingController();
 final phoneNumber =TextEditingController();

 GlobalKey<FormState> signupFormKey=GlobalKey<FormState>() ;

 // SINGUP
 Future<void> signup() async{
  try{
    // Start Loading
    TFUILScreenLoader.openLoadingDialog('We are processing your information...', TImages.docer);

    //Check Internet Connectivity
    final isConnected=await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFUILScreenLoader.stopLoading();
       return;
    }

    //Form Validation
    if(!signupFormKey.currentState!.validate()) return;

    // Privacy Policy Check
    if(!privacyPolicy.value){
      TFUILScreenLoader.stopLoading();
      TLoader.warningSnackBar(
        title: 'Accept Privacy Policy', 
        message: 'In order to create account, you must to read and accept the Privacy policy & Terms of Use.');
       return;
    }

    //Register user in the Firebase Authentication & save user data in the firebase
    final userCredential= await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());// or we can  create an insatnce and store in var
    //these will throw the exception and it will catch by catch block

    // Save Authenticated user data in the firebase Firestore
    final newUser=UserModel(
      id: userCredential.user!.uid, 
      username: username.text, 
      email: email.text, 
      firstName: firstName.text, 
      lastName: lastName.text, 
      phoneNumber: phoneNumber.text, 
      profilePicture: "");

      final userRepository=Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFUILScreenLoader.stopLoading();

      //Show Success Message
      TLoader.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify eamil to continue.');
        
      // Move to Verify Email Screen
      Get.to(()=>  VerifyEmailScreen(email: email.text.trim()
      ,));

  }
  catch(e){
    //Remove Loader
     TFUILScreenLoader.stopLoading();

    // Show some Generic Error to the user
     TLoader.warningSnackBar(title: 'Oh snap', message: e.toString());
  }
  
 }
}