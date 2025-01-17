import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/firebase_options.dart';
import 'package:get/get.dart';
void main()async {

final WidgetsBinding widgetsBinding=  WidgetsFlutterBinding.ensureInitialized();

//-- GetX LocalStorage
await GetStorage.init();

//-- Await Splash until other item load
FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

await Firebase.initializeApp( //| these will check current platform whether it is android web
options: DefaultFirebaseOptions.currentPlatform).then(
  (FirebaseApp value)=>Get.put(AuthenticationRepository())
);
 
 // Call the function to activate App Check
   await FirebaseAppCheck.instance.activate(
    
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  
    androidProvider: AndroidProvider.debug,
   
    appleProvider: AppleProvider.appAttest,
  );


runApp(const App());

}
  

