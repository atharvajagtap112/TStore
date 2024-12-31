

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/BrandCategoryModel.dart';
import 'package:t_store/features/shop/models/brand_Product.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';
import 'package:t_store/utils/helpers/firebase_storage_service.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance =>Get.find();
    final _db=FirebaseFirestore.instance;

// Get limited featured products
  Future<List<ProductModel>> getFeaturedProduct() async{
     try{
      final snapshot=await _db.collection('Products').where('IsFeatured', isEqualTo: true ).limit(4).get();
      return snapshot.docs.map((e)=> ProductModel.fromSnapshot(e)).toList();

     } on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
           
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            } }

        Future<List<ProductModel>> getAllFeaturedProduct() async{
     try{
      final snapshot=await _db.collection('Products').where('IsFeatured', isEqualTo: true ).get();
      return snapshot.docs.map((e)=> ProductModel.fromSnapshot(e)).toList();

     } on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
           
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            } }     


 Future<List<ProductModel>> getProductsByQuery(Query query ) async{
     try{
      final querySnapshot=await query.get();
          final List<ProductModel>   productList =querySnapshot.docs.map((document)=> ProductModel.fromQuerySnapshot(document)  ).toList();
          return productList;
     } on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
           
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            } 
            }


      Future<List<ProductModel>> getFavouriteProducts(List<String> productsIds ) async{
     try{
      final querySnapshot= await _db.collection('Products').where(FieldPath.documentId, whereIn: productsIds).get();
          final List<ProductModel>   productList =querySnapshot.docs.map((document)=> ProductModel.fromQuerySnapshot(document)  ).toList();
          return productList;
     } on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
           
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            } 
            }       


  //upload dummy data to the cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async{
       try{
         final storage=Get.put(TFirebaseStorageService());
        for(var product in products){
          //Get image data link form local assets
           final thumbnail=await storage.getImageDataFromAssets(product.thumbnail!);
            
            final url=await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());
              await Future.delayed(const Duration(milliseconds: 500));
            product.thumbnail=url;

             //Brand Image
                  final logoImage= await storage.getImageDataFromAssets( product.brand!.image);
                   final logoUrl=await storage.uploadImageData('Products/Images', logoImage, product.brand!.image);
                     await Future.delayed(const Duration(milliseconds: 500));
               product.brand!.image=logoUrl;
               
              //product list of images
            if(product.images!=null && product.images!.isNotEmpty){
              List<String> imageUrl=[];
              for(var image in product.images!){
                // Get images as in file as Uint8List
                 final assetImage= await storage.getImageDataFromAssets(image);
                 
                 // Upload image and get its URL 
                 final url = await storage.uploadImageData('Products/Images', assetImage, image);
                 imageUrl.add(url);     
              }
              product.images!.clear();
              product.images!.addAll(imageUrl);
            }


             //Upload Varitaion Images
             if(product.productType==ProductType.variable.toString()) {
                for (var variation in product.productVariations!){
                  final assetImage= await storage.getImageDataFromAssets(variation.image);

                  final url= await storage.uploadImageData('Products/Images', assetImage, variation.image);

                  variation.image=url;
                }}

                //Store product in Firebase
                await _db.collection('Products').doc(product.id).set(product.toJson());

                print('${product.title}  has been  Uploaded to firebase successfully.                   :) ');

        }
       }  
            on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
            on SocketException catch(e){
               throw e.message;
            }
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw e.toString();
            }
  }

    Future<List<ProductModel>> getProductsForBrands( { required brandId, int limit=-1}) async{
      try{
     final querySnapshot = limit==-1
     ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get() :  
                    await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
          final product= querySnapshot.docs.map((product)=> ProductModel.fromSnapshot(product) ).toList();      
          return product;   
                
       }on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
           
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            }

}

 Future<List<ProductModel>> getProductsForCategory( { required categoryId, int limit=-1}) async{
      try{ 
     final querySnapshot = limit==-1
     ? await _db.collection('ProductCategories').where('categoryId', isEqualTo: categoryId).get() :  
                    await _db.collection('ProductCategories').where('categoryId', isEqualTo: categoryId).limit(limit).get();
              


          final List<String> productIds= querySnapshot.docs.map((doc)=>doc['productId'] as String).toList();    
          print(productIds);  

         final productQuery=await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
       final List<ProductModel> products =  productQuery.docs.map( (doc)=> ProductModel.fromSnapshot(doc)).toList();
       return products;
                
       }on FirebaseException catch(e){
               throw TFirebaseAuthException(e.code).message;
            }
           
            on PlatformException catch(e){
              throw TPlatformException(e.code);
            }
            catch(e){
              throw 'Something went wrong. please try again';
            }

}




void uploadProductCategoryToFirestore(List<ProductCategory> productCategories) async {
  // Reference to your Firestore collection
  var collectionRef = FirebaseFirestore.instance.collection('ProductCategories');

  // Iterate over each BrandProduct in the list and upload it to Firestore
  for (var brandProduct in productCategories) {
    try {
      // Adding data to Firestore
      await collectionRef.add(brandProduct.toJson());
    } catch (e) {
      print('Error uploading brand product: $e');
    }
  }
}



 // Upload the list of BrandCategoryModel to Firestore
  Future<void> uploadBrandCategories(List<BrandCategoryModel> brandCategoryList) async {
    try {
      // You may want to use a batch write for efficient uploads
     final collectionRef = FirebaseFirestore.instance.collection('Categories');

      // Iterate over the BrandCategory list
      for (var brandCategory in brandCategoryList) {
        // Create a document reference where the ID is the brandId + productId (for example)
       await collectionRef.add(brandCategory.toJson());

      
      }

     
      print("Brand categories uploaded successfully!");
    } catch (e) {
      print("Error uploading brand categories: $e");
    }
  }

}