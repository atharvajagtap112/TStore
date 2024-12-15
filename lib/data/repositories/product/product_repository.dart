

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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





  //upload dummy data to the cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async{
       try{
         final storage=Get.put(TFirebaseStorageService());
        for(var product in products){
          //Get image data link form local assets
           final thumbnail=await storage.getImageDataFromAssets(product.thumbnail!);
            
            final url=await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());
            product.thumbnail=url;

             //Brand Image
                  final logoImage= await storage.getImageDataFromAssets( product.brand!.image);
                   final logoUrl=await storage.uploadImageData('Products/Images', logoImage, product.brand!.image)    ;
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

}