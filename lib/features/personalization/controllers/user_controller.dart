import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalization/screens/profile/re_authenticate_user_login_form.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/firebase_exceptions_and_user_model.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class UserController extends GetxController{
   static UserController get instance=> Get.find(); // single line function
   // whenever we want to use object of usercontroller we can use these function we dont need to use get.put again and again 
   //the get.find will find the instance from memory and use it 
   Rx<UserModel>user=UserModel.empty().obs;  
   final profileLoader=false.obs;  
   
   
   final userRepository=Get.put(UserRepository());
   Rx<bool> hidePassword=false.obs;
   final verifyEmail=TextEditingController();
   final verifyPassword=TextEditingController();
   final GlobalKey<FormState> reAuthFormKey=GlobalKey<FormState>();

    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUserRecord();
  }
    
    
    Future<void> fetchUserRecord() async{
        try{
         profileLoader.value=true; 
        final user= await userRepository.fetchUserDetails();
        this.user(user);
        }
        catch(e){
          user(UserModel.empty());
        }
        finally{
          profileLoader.value=false;
        }
    }
     
   Future<void> saveUserRecord(UserCredential? userCredential) async{
              
    try{    //First update Rx User and then check if user data is already stored. If not store new data
          await fetchUserRecord();// so these will prevent to call the func again and it will to reduce the read 
           if(user.value.id.isEmpty){
          if(userCredential!=null ){
            // these will be for new sigup 
            //get the name form credentials and divide in to parts if null the " "
          final namePart = UserModel.nameParts( userCredential.user!.displayName?? '')  ;
          final username  = UserModel.generateUsername(userCredential.user!.displayName);
          
          final user=UserModel(
            id: userCredential.user!.uid, 
            username: username,
             email: userCredential.user!.email?? '', 
             firstName: namePart[0], 
             lastName: namePart.length>1? namePart.sublist(1).join(' ') :'',
             phoneNumber: userCredential.user!.phoneNumber?? ''  , 
             profilePicture: userCredential.user!.photoURL?? "");
             
             final userRepository=Get.put(UserRepository());
             //save data in firebase
             await userRepository.saveUserRecord(user);

          }
          
           }
    }
     catch(e){
    //Remove Loader
   
    // Show some Generic Error to the user
     TLoader.warningSnackBar(title: 'Oh snap', message: e.toString());
  }
   }
 
 //Delete Account Waring
 void deleteAccountWarnigPopup(){
  Get.defaultDialog(
    contentPadding:const EdgeInsets.all(TSizes.md),
    title: 'Delete Account',
    middleText: 'Are you want to delete your account permanently? This action is not resversible and all your data will be removed permanently',
    confirm: ElevatedButton( 
      onPressed: () async => deleteUserAccount(), 
    style: ElevatedButton.styleFrom( backgroundColor: Colors.red, side: const BorderSide(color: Colors.red) )
    ,child: const Padding(
      padding:  EdgeInsets.symmetric(horizontal: TSizes.lg ),
      child:  Text('Delete'),
    )),
    cancel: OutlinedButton(onPressed: ()=> Navigator.of(Get.overlayContext! ).pop(), child: const Text('Cancel'))
  );
 }
  
 //Delete User Account
 void deleteUserAccount() async{
  try{
  TFUILScreenLoader.openLoadingDialog('Proccessing', TImages.docer);
   final auth=AuthenticationRepository.instance;
  final provider=FirebaseAuth.instance.currentUser!.providerData.map((e)=>e.providerId).first;
  //providerData cantain the list of UserInfo form which we can get wether user is login with google, facebook, email;
  if(provider.isNotEmpty){
    if(provider=='google.com'){
       await auth.SignInWithGoogle();
       await auth.deleteAccount();// delete form database
        TFUILScreenLoader.stopLoading();
        Get.offAll(()=> const LoginScreen());
    }

    else if(provider=='password'){
       TFUILScreenLoader.stopLoading();
       Get.to(()=> const ReAuthLoginForm());
    }
  }
  }
  catch (e){
    TFUILScreenLoader.stopLoading();
    TLoader.warningSnackBar(title: 'Oh Snap!', message: e.toString());
  }

 }
 
 // --RE-AUTHENTICATE before deleting
void reAuthenticateEmailAndPasswordUser() async{
  try{
  TFUILScreenLoader.openLoadingDialog('Proccessing', TImages.docer);
   
   final isConnected=await NetworkManager.instance.isConnected();
   if(!isConnected){
    TFUILScreenLoader.stopLoading();
    return;
   }

   if(!reAuthFormKey.currentState!.validate()){
    TFUILScreenLoader.stopLoading();
    return;
   }  

   await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(),verifyPassword.text.trim());
await AuthenticationRepository.instance.deleteAccount();
TFUILScreenLoader.stopLoading();
Get.offAll(()=> const LoginScreen());
  }
  catch (e){
    TFUILScreenLoader.stopLoading();
    TLoader.warningSnackBar(title: 'Oh Snap!', message: e.toString());
  }

 }
  
 void uploadImageProfilePicture() async{
     try{
     final image= await ImagePicker().pickImage(source: ImageSource.gallery , imageQuality: 70, maxHeight: 512, maxWidth: 512);
     if(image !=null){
      final imageUrl= await UserRepository.instance.uploadImage('Users/Images/Profile', image);
      Map<String, dynamic> json={'ProfilePicture':imageUrl};
      await UserRepository.instance.updateSingleField(json);
    
      user.value.profilePicture=imageUrl;
     TLoader.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');
     }}
     catch(e){
      TLoader.errorSnackBar(title:'OhSnap' , message:'Something went wrong: $e' );
     }
 } 
}          