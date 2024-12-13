import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/helpers/firebase_storage_service.dart';

class CategoriesRepository extends GetxController {
 static CategoriesRepository get instance=>Get.find();
 
  final _db=FirebaseFirestore.instance;

  //Get all Categories
  Future<List<CategoryModel>> getAllCategories() async{
   try{ // The data is in form of list of document snapshot we can use map to map every element and convert from Document snapshort to model 
    //which will be the list of CategoriesModel
     final snapshot =await _db.collection('Categories').get(); //List
   print(snapshot.docs.length);
     final list=snapshot.docs.map( (document)=>   CategoryModel.fromSnapshot(document)).toList();
    
     return list;
   } on FirebaseException catch(e){
    throw TFirebaseAuthException(e.code).message;
   } on FormatException catch(_){
    throw const TFormatException();
   } catch(e){
    throw 'Something went wrong. please try again';
            }
  }   

   // Upload Categories to the Cloud Firebase
Future<void> uploadDummyData(List<CategoryModel> categories) async {
  // Upload all the Categories along with their Images
  final storage = Get.put(TFirebaseStorageService());

  // Loop through each category
  for (var category in categories) {
    // Get ImageData link from the local assets
    final file = await storage.getImageDataFromAssets(category.image);

    // Upload Image and Get its URL
    final url = await storage.uploadImageData('Categories', file, category.name);

    // Assign URL to Category.image attribute
    category.image = url;

    // Store Category in Firestore
    await _db.collection('Categories').doc(category.id).set(category.toJson());
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
}


}
