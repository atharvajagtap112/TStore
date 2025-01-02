import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String id;
  final String userName;
  final String userImage;
  final double rating;
  final String comment;
  final DateTime? date;
  final String productImage;
  final StoreResponse? storeResponse;

  ReviewModel({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
    required this.date,
    this.storeResponse,
    required  this.productImage
  });
   
    static ReviewModel get empty=> ReviewModel(id: "", userName: "", userImage: "", rating: 0, comment: "", date: null, productImage: "");

  // Factory method to create ReviewModel from JSON
  factory ReviewModel.fromJson(DocumentSnapshot<Map<String,dynamic>> snapshot) {
   final Map<String, dynamic> doc=snapshot.data()!;
    return ReviewModel(
      productImage:doc['productImage']??"",
      id: doc['id'] ?? '',
      userName: doc['userName'] ?? '',
      userImage: doc['userImage'] ?? '',
      rating: (doc['rating'] ?? 0).toDouble(),
      comment: doc['comment'] ?? '',
      date: DateTime.parse(doc['date'] ?? DateTime.now().toIso8601String()),
      storeResponse: doc['storeResponse'] != null 
          ? StoreResponse.fromJson(doc['storeResponse']) 
          : null,
    );
  }

  // Convert ReviewModel to JSON
  Map<String, dynamic> toJson() {
    return {
       'productImage':productImage,
      'id': id,
      'userName': userName,
      'userImage': userImage,
      'rating': rating,
      'comment': comment,
      'date': date!.toIso8601String(),
      'storeResponse': null,
    };
  }
}

// Store Response Model
class StoreResponse {
  final String comment;
  final DateTime date;

  StoreResponse({
    required this.comment,
    required this.date,
  });

  factory StoreResponse.fromJson(Map<String, dynamic> json) {
    return StoreResponse(
      comment: json['comment'] ?? '',
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'date': date.toIso8601String(),
    };
  }
}
