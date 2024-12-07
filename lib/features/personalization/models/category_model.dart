// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.isFeatured,
  });
  
  static CategoryModel empty()=> CategoryModel(id: "", name: "", image: "", parentId: "", isFeatured: false);

  Map<String,dynamic> toJson(){
      return {
        'Image':image,
        'IsFeatured':isFeatured,
        'Name':name,
        'ParentId':parentId
      }  ;
  }
     
   // Map Json oriented document snapshot from Firebase to UserModel  
  factory CategoryModel.fromSnapshot (DocumentSnapshot<Map<String,dynamic>> document){
        if(document.data()!=null){
          final data=document.data()!;

          //Map JSON Record to the Model
          // Storing in model // you can return map also but storing in class will be better to access
          return CategoryModel(
            id: document.id, 
            name: data['Name']??'',
            image: data['Image']??'', 
            parentId: data['ParentId']??'', 
            isFeatured: data['IsFeatured']?? false
            );
          }
        else{
          return CategoryModel.empty();
        }
  }
}
