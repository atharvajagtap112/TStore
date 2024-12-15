import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';
import 'package:t_store/utils/helpers/firebase_storage_service.dart';

class BannersRepositories extends GetxController{
    static BannersRepositories get instance=>Get.find();
 final _db=FirebaseFirestore.instance;

  
  // Get all orders realated to current user
 Future<List<BannerModel>> fetchBanners() async{
  try{
  final result= await _db.collection('Banners').where('active', isEqualTo: true).get();// get the list of type QuerySnapshot<Map<String, dynamic>> 
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

 Future<void> uploadDummyData(List<BannerModel> banners) async {
  final storage = Get.put(TFirebaseStorageService());

  // Loop through each banner
  for (var banner in banners) {
    try {
      // Get ImageData link from the local assets
      final file = await storage.getImageDataFromAssets(banner.imageUrl);

      // Upload Image and Get its URL
      final url = await storage.uploadImageData('Banners/Images', file, banner.name);

      // Assign URL to Banner's image attribute
      banner.imageUrl = url;

      // Store Banner in Firestore
      await _db.collection('Banners').doc(banner.name).set(banner.toJson());

    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, message: e.message, plugin: 'Firebase Storage');
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Error uploading banner data: $e';
    }
  }
}
}