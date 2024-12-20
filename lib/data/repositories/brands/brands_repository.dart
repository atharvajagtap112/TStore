import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';
import 'package:t_store/utils/helpers/firebase_storage_service.dart';

class BrandRepository extends GetxController{
  static BrandRepository get instance=> Get.find();
   
     final _db=FirebaseFirestore.instance;

     Future<List<BrandModel>> getAllBrands() async{
      try{
      final snapshot= await _db.collection('Brands').get();
       return snapshot.docs.map((document)=> BrandModel.fromSnapshot(document)).toList();
       } on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
           
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            } }     

         // Upload Categories to the Cloud Firebase
Future<void> uploadDummyData(List<BrandModel> brands) async {
  // Upload all the Categories along with their Images
  final storage = Get.put(TFirebaseStorageService());

  // Loop through each category
  for (var brand in brands) {
    // Get ImageData link from the local assets
    final file = await storage.getImageDataFromAssets(brand.image);

    // Upload Image and Get its URL
    final url = await storage.uploadImageData('Categories', file, brand.name);

    // Assign URL to Category.image attribute
    brand.image = url;

    // Store Category in Firestore
    await _db.collection('Brands').doc(brand.id).set(brand.toJson());
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



//-------Get Brands For Category
Future<List<BrandModel>> getBrandsForPerticularCategoryId(String categoryId ) async{
  try{ // get the query of brands and category id bridge
    QuerySnapshot brandsCategoryQuery=await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();
       
       // these will contains the list of brands ids
      final List<String> brandsId= brandsCategoryQuery.docs.map( (doc)=> doc['brandId'] as String ).toList();
       
         final brandQuery = await _db.collection('Brands').where(FieldPath.documentId , whereIn: brandsId).get();
          
          final List<BrandModel> brands   =brandQuery.docs.map( (doc)=> BrandModel.fromSnapshot(doc)).toList();
      return brands;

  } on FirebaseException catch (e) {
    throw FirebaseException(code: e.code, message: e.message, plugin: '');
  } on PlatformException catch (e) {
    throw PlatformException(code: e.code, message: e.message);
  } catch (e) {
    throw 'Something went wrong. Please try again.';
  }
}


   }