import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/data/repositories/Reviews/reviews_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/shop/models/review_model.dart';
import 'package:t_store/utils/helpers/firebase_storage_service.dart';

class ReviewController extends GetxController {
  static ReviewController get instance => Get.find();

  final reviewTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  final firebaseStorageService=Get.put(TFirebaseStorageService());
  final  user= UserController.instance;
  final reviewsRepository=Get.put(ReviewsRepository());
  // Observables
  final RxDouble avgRating=0.0.obs;
  final RxDouble rating = 0.0.obs;
  final RxString selectedImagePath = ''.obs;
  final RxBool isLoading = false.obs;
  final Rx<XFile?> selectedImage=Rx<XFile?>(null);
  // Image picker
  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath.value = image.path;
      selectedImage.value=image;
    }
  }

  // Remove selected image
  void removeImage() {
    selectedImagePath.value = '';
  }

  // Submit review
  Future<void> submitReview(String ProductId) async {
    if (!formKey.currentState!.validate() || rating.value == 0) {
      if (rating.value == 0) {
        TLoader.errorSnackBar (  title: 'OhSnap' ,message:  'Please add a rating');
      }
      return;
    }

    try {
      isLoading.value = true;
      

       String? uploadedImageUrl;
      if (selectedImagePath.value.isNotEmpty) {
      final  uploadedImageUrl =   await firebaseStorageService.uploadImageFile('reviews/', selectedImage.value!);
       await Future.delayed(const Duration(seconds: 1));
      }


      // Create review object
      final review = ReviewModel(
        productImage: uploadedImageUrl??"",
        id: DateTime.now().toString(),
        userName: user.user.value.fullName, // Get from user profile
        userImage: user.user.value.profilePicture??"", // Get from user profile
        rating: rating.value,
        comment: reviewTextController.text,
        date: DateTime.now(),
      );

      // TODO: Add your API call here
   // Simulate API call
      await reviewsRepository.uploadReviews(ProductId, review);


      isLoading.value = false;
      Get.back();
     TLoader.successSnackBar(title: 'Review submitted successfully!');
      
    } catch (e) {
      isLoading.value = false;
     TLoader.errorSnackBar (title: 'OhSnap' ,message: 'Something went wrong. Please try again.');
    }
  }

  // Helper methods for showing messages
 

  @override
  void onClose() {
    reviewTextController.dispose();
    super.onClose();
  }



  Future<List<ReviewModel>> getReviewsOfProducts(String productId) async{
    try {
    final list= await reviewsRepository.getProductsReviews(productId);
    averageRating(list);
    return list;

    } catch(e){
      throw e.toString();
    }
  }
   
   double averageRating(List<ReviewModel> list){
      double sum= 0;
       for(var reviewModel in list) {
        sum+=reviewModel.rating;
       }
       
      avgRating.value=sum/list.length;
      return sum/list.length;
   }
 
}
