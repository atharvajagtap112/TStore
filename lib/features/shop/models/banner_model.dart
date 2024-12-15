// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  
  String imageUrl;
  String targetScreen;
  bool active;
  String name;
  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
    required this.name
  });

  Map<String,dynamic> toJson(){
     return {
      'imageUrl':imageUrl,
      'targetScreen':targetScreen,
      'active':active,
      'name':name
     };
  }

  factory BannerModel.snapshot(DocumentSnapshot<Map<String,dynamic>> snapshot){
    final data=snapshot.data() as  Map<String,dynamic>;
    return BannerModel(
      name: data['name']??"",
      imageUrl: data['imageUrl']??"",
     targetScreen: data['targetScreen']??"",
      active: data['active']?? false
      );
  }
}
