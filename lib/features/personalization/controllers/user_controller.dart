import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/utils/helpers/firebase_exceptions_and_user_model.dart';

class UserController extends GetxController{
   static UserController get instance=> Get.find(); // single line function
   // whenever we want to use object of usercontroller we can use these function we dont need to use get.put again and again 
   //the get.find will find the instance from memory and use it 

   Future<void> saveUserRecord(UserCredential? userCredential) async{
    
    try{    
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
             userRepository.saveUserRecord(user);

          }
          
       
    }
     catch(e){
    //Remove Loader
   
    // Show some Generic Error to the user
     TLoader.warningSnackBar(title: 'Oh snap', message: e.toString());
  }
   }

}