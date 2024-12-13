import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';
import 'package:t_store/utils/helpers/firebase_storage_service.dart';

class BannersRepositories {
 final _db=FirebaseFirestore.instance;

  
  // Get all orders realated to current user
 Future<List<BannerModel>> fetchBanners() async{
  try{
  final result= await _db.collection('Banners').where('Active', isEqualTo: true).get();// get the list of type QuerySnapshot<Map<String, dynamic>> 
  //result.docs() get the list of List<yDocumentSnapshot<T>> now we can apply list opreations
  return result.docs.map((documentSnapshot)=> BannerModel.snapshot(documentSnapshot) ).toList();
  }  on FirebaseAuthException catch(e){
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

    // Upload Categories to the Cloud Firebase
Future<void> uploadDummyData(List<BannerModel> banners) async {
  // Upload all the Categories along with their Images
  final storage = Get.put(TFirebaseStorageService());

  // Loop through each category
  for (var banner in banners) {
    // Get ImageData link from the local assets
    final file = await storage.getImageDataFromAssets(banner.imageUrl);

    // Upload Image and Get its URL
    final url = await storage.uploadImageData('Banners', file, banner.name);

    // Assign URL to Category.image attribute
    banner.imageUrl = url;

    // Store Category in Firestore
    await _db.collection('Categories').doc(banner.name).set(banner.toJson());
  }

  // Error handling
  try {  
    // Additional functionality can be added here
  } on FirebaseException catch (e) {
    throw FirebaseException(code: e.code, message: e.message, plugin: '');
  } on PlatformException catch (e) {
    throw PlatformException(code: e.code, message: e.message);
  } catch (e) {
    throw 'Something went wrong. Please try again.';
  }

}}