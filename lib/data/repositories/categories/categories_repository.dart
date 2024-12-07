import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/models/category_model.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class CategoriesRepository extends GetxController {
 static CategoriesRepository get instance=>Get.find();
 
  final _db=FirebaseFirestore.instance;

  //Get all Categories
  Future<List<CategoryModel>> getAllCategories() async{
   try{ // The data is in form of list of document snapshot we can use map to map every element and convert from Document snapshort to model 
    //which will be the list of CategoriesModel
     final snapshot =await _db.collection('Categories').get(); //List
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



}