
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:t_store/navigationMenu.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance=> Get.find();// getter method of type AuthenticationRepository 
                                                                
  final deviceStorage=GetStorage(); 
  final _auth=FirebaseAuth.instance; // we have created instance at main    
  // Called from main.dart on app launch
  @override
  void onReady(){ // inbuilt function
    FlutterNativeSplash.remove();
    screenRedirect();
  }
   
   void screenRedirect() async{
    final user=_auth.currentUser;
      if(user!=null){// if user is authenticated
        if(user.emailVerified){
          Get.offAll(()=> const NavigationMenu());
        }
        else{
          Get.offAll(VerifyEmailScreen(email: user.email));
        }
      }
      else{
     //Local Storage
     deviceStorage.writeIfNull('IsFirstTime', true); // only if it is null that key is not created
     deviceStorage.read('IsFirstTime')!=true
     ?
      Get.offAll(const LoginScreen())
      :
      Get.offAll(const OnboardingScreen());

      }


   } 

   /*------------------------ Federated identity & social sign in---------------------------------*/

   // GoogleAuthentication - GOOGLE

       Future<UserCredential> SignInWithGoogle() async{
       try{
          // Trigger the authentication flow 
           final GoogleSignInAccount? userAccount =await GoogleSignIn().signIn(); // popup of signIn

           // Obtain the auth details from the request
           final GoogleSignInAuthentication? googleAuth=await userAccount?.authentication;// these will store the authentication of crnt user
           
           // get credential 
           final credentials=GoogleAuthProvider.credential( accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
           
           // to sign in with fedral entity firebase uses credential appoarch
          // Once signed in return the UserCredential
           return FirebaseAuth.instance.signInWithCredential(credentials);
       }
          on FirebaseAuthException catch(e){
              throw TFirebaseAuthException(e.code).message;
            }
            on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
            on FormatException catch(_){  
               throw const TFormatException();
            }
             on PlatformException catch(e){
               throw 'PlatformException: ${e.code} - ${e.message}';
             }
            
            catch(e){
              throw 'Something went wrong. please try again';
            }


       }
   /* ----------------------- Email & Password sign-in -------------------------*/

          
   /// [EmailAuthentication] - SignIn
   
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
       try{
       return await _auth.signInWithEmailAndPassword(email: email, password: password);
       }
          on FirebaseAuthException catch(e){
              throw TFirebaseAuthException(e.code).message;
            }
            on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
            on FormatException catch(_){
               throw const TFormatException();
            }
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            }

  }

   /// [EmailAuthentication] - REGISTER

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
            try{
                return await _auth.createUserWithEmailAndPassword(email: email, password: password) ;    
            }
            on FirebaseAuthException catch(e){
              throw TFirebaseAuthException(e.code).message;
            }
            on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
            on FormatException catch(_){
               throw const TFormatException();
            }
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            }
  }
      
  // Email Verification Mail Verification
  Future<void> sendEmailVerification() async{
     try{
     FirebaseAuth.instance.currentUser!.sendEmailVerification();
     }
      on FirebaseAuthException catch(e){
              throw TFirebaseAuthException(e.code).message;
            }
            on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
            on FormatException catch(_){
               throw const TFormatException();
            }
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            }
  }

  // LogutUser - Vaild for any authentication
  Future<void> logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());
    }
   on FirebaseAuthException catch(e){
              throw TFirebaseAuthException(e.code).message;
            }
            on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
            on FormatException catch(_){
               throw const TFormatException();
            }
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            }
  }

  //[EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async{
     try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.offAll(()=> const LoginScreen());
    }
   on FirebaseAuthException catch(e){
              throw TFirebaseAuthException(e.code).message;
            }
            on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
            on FormatException catch(_){
               throw const TFormatException();
            }
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            }

  }
}