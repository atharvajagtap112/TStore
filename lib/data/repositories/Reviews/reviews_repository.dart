import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/review_model.dart';

class ReviewsRepository extends GetxController {
static  ReviewsRepository get instance=>Get.find();

final _db=FirebaseFirestore.instance;

 Future<void> uploadReviews(String ProductId, ReviewModel review) async{
  
try{
  await _db.collection('Products').doc(ProductId).collection('Reviews').add(review.toJson());
}
catch(e){
  throw e.toString();
}
}

Future<List<ReviewModel>> getProductsReviews(String ProductId) async{
  try{
 final snapshot= await _db.collection('Products').doc(ProductId).collection('Reviews').get();
return snapshot.docs.map((document)=> ReviewModel.fromJson(document)).toList();
  } catch(e){
    throw e.toString();
  }
}


}