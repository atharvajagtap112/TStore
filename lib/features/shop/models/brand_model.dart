// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productCount,
  });
    
    static BrandModel get empty=> BrandModel(id: '', name: '', image: '');

    toJson(){
      return {
       'Id':id,
       'Name':name,
       'Image':image,
       'ProductsCount':productCount,
       'IsFeatured':isFeatured
      };
    }
   
    //Map Json oriented document snapshot from firebase to usermodel
    factory BrandModel.fromJson(Map<String, dynamic> document ){
      final data=document;
      if(data.isEmpty) return BrandModel.empty;
      return BrandModel(
        id: data['Id']??'', 
        name: data['Name']??'',
         image: data['Image']??'',
         isFeatured: data['IsFeatured']?? false,
         productCount: data['ProductsCount']??0
         );
    }


    factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document ){
      final data=document.data();
      if(data==null) return BrandModel.empty;
      return BrandModel(
        id: data['Id']??'', 
        name: data['Name']??'',
         image: data['Image']??'',
         isFeatured: data['IsFeatured']?? false,
         productCount: data['ProductsCount']??0
         );
    }
}
