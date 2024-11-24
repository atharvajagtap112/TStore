import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find(); 
  // these find the OnBoardingController instance object that we have pass in onBoarding and these is an short function which return
  // OnBoardingController and we use get and name these func as instance 
   
  /// Variables
  final pageController=PageController();
  Rx<int> currentPageIndex=0.obs;  //these is an observer which will change the design without using statefull widget
 //^ we can use final also insatnt of Rx<int>
  /// Update Current Index when Page Scroll
  //like to modify the currentPageIndex value we need to create setState 
  void updatePageIndicator (index) {
   currentPageIndex.value=index;
   
  }

  /// Jump to the specific dot selected page.
  void dotNavigationClick (index) {
    currentPageIndex.value=index;
    pageController.jumpToPage(index);
  }
  /// Update Current Index & jump to next page
  void nextPage() {
    if(currentPageIndex.value==2){
      final storage=GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(const LoginScreen());  // Get.offAll will remove all previous screen
        }
    else{
      int page=currentPageIndex.value+1;
      pageController.jumpToPage(page);
    }
  }
  /// Update Current Index & jump to the last Page
  void skipPage() {
    currentPageIndex.value=2;
    pageController.jumpToPage(2);
  }
}