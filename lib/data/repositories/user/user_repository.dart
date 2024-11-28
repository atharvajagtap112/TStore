import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/utils/helpers/firebase_exceptions_and_user_model.dart';

class UserRepository extends GetxController {
    static UserRepository get instance=>Get.find();

    final FirebaseFirestore _db=FirebaseFirestore.instance;

    Future<void> saveUserRecord(UserModel user)async{
       try{
        await _db.collection("Users").doc(user.id).set(user.toJson());
       }
       on FirebaseException catch(e){
        throw TFirebaseException(e.code);
       }
        on FormatException catch(_){
        throw const TFormatException();
       }
        on PlatformException catch(e){
          throw TPlatformException(e.code); 
        }
        catch(e){
          throw 'Something went wrong. pLease try again';
        }

         }

     Future<UserModel>fetchUserDetails()async{
         try{
           final documentSnapshot=await _db.collection('Users').doc(AuthenticationRepository.instance.authUser!.uid).get(); 
           if(documentSnapshot.exists){
              return UserModel.fromSnapshot(documentSnapshot);
           }
           else{
            return UserModel.empty();
           }
         } 
       on FirebaseException catch(e){
        throw TFirebaseException(e.code);
       }
        on FormatException catch(_){
        throw const TFormatException();
       }
        on PlatformException catch(e){
          throw TPlatformException(e.code);
        }
        catch(e){
          throw 'Something went wrong. pLease try again';
        }
     }  
       
     //Function to update user data in Firebase  
      Future<void> updateUserDetails(UserModel updateUser) async{
        try{
       await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());
        }
           on FirebaseException catch(e){
        throw TFirebaseException(e.code);
       }
        on FormatException catch(_){
        throw const TFormatException();
       }
        on PlatformException catch(e){
          throw TPlatformException(e.code);
        }
        catch(e){
          throw 'Something went wrong. pLease try again';
        }}     


         //update any field in specific Users Collection
      Future<void> updateSingleField(Map<String,dynamic> json) async{
        try{
       await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
        }
           on FirebaseException catch(e){
        throw TFirebaseException(e.code);
       }
        on FormatException catch(_){
        throw const TFormatException();
       }
        on PlatformException catch(e){
          throw TPlatformException(e.code);
        }
        catch(e){
          throw 'Something went wrong. pLease try again';
        }}     

        // Function to remove user data from Firebase
         Future<void> removeUserRecord() async{
        try{
       await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).delete();
        }
           on FirebaseException catch(e){
        throw TFirebaseException(e.code);
       }
        on FormatException catch(_){
        throw const TFormatException();
       }
        on PlatformException catch(e){
          throw TPlatformException(e.code);
        }
        catch(e){
          throw 'Something went wrong. pLease try again';
        }}     
}