import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
   static LoginController get instance=> Get.find();
     
   final localStorage=   GetStorage();
   //Variable
   final rememberMe=false.obs;
   final hidePassword=true.obs;
   final email=TextEditingController();
   final password=TextEditingController();
   final GlobalKey<FormState> loginFormKey=GlobalKey<FormState>();

    @override
      onInit(){
        if(localStorage.read('REMEMBER_ME_EMAIL')!=null&&
          localStorage.read('REMEMBER_ME_PASSWORD')!=null){

        email.text=localStorage.read('REMEMBER_ME_EMAIL');
        password.text=localStorage.read('REMEMBER_ME_PASSWORD');
        }
        super.onInit();
    }
    
   Future<void> emailAndPasswordSignIn() async{
  try{
    // Start Loading
    TFUILScreenLoader.openLoadingDialog('Logging you in', TImages.docer);

    //Check Internet Connectivity
    final isConnected=await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFUILScreenLoader.stopLoading();
       return;
    }

    //Form Validation
    if(!loginFormKey.currentState!.validate()){
    TFUILScreenLoader.stopLoading();
     return;
    } 

    

   
     //Remember Me 
     if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
       

     }
    print(password.text);

    //Login user in the Firebase Authentication
        final userCredential= await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());// or we can  create an insatnce and store in var
    //these will throw the exception and it will catch by catch block
    

      // Remove Loader
      TFUILScreenLoader.stopLoading();
      
      //Redirect
      AuthenticationRepository.instance.screenRedirect();

     
     

  }
  catch(e){
    //Remove Loader
     TFUILScreenLoader.stopLoading();

    // Show some Generic Error to the user
     TLoader.warningSnackBar(title: 'Oh snap', message: e.toString());
  }
  
 }


  Future<void> googleSignIn() async{
     try{
       // Start Loading
       TFUILScreenLoader.openLoadingDialog('Logging you in...', TImages.docer);
       //NetworkManager.instance will get the instance that we created in that class itself or created an instance of it in these class and we have created the instance use Get.put
       //or use get.find in class to use it 
       final isConnected=await NetworkManager.instance.isConnected();
       if(!isConnected) {
        TFUILScreenLoader.stopLoading();
        return;
       }

       // Google Authentication
       // we an created the instance of authentication respository in main when firebase initiallise
        final userCredential=await AuthenticationRepository.instance.SignInWithGoogle();
           
      // these controller is just for sign In and not to store the data so we are creating another controller fr it 
      // you can write these class also
      final userController=Get.put(UserController());
       await userController.saveUserRecord(userCredential)    ;
         TFUILScreenLoader.stopLoading();
        
        //Redirect
         AuthenticationRepository.instance.screenRedirect();
         
     }
      catch(e){
    //Remove Loader
     TFUILScreenLoader.stopLoading();

    // Show some Generic Error to the user
     TLoader.warningSnackBar(title: 'Oh snap', message: e.toString());
  }

  }   
}


