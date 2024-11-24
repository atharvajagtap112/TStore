import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onBoarding_dot_navigation.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onBoarding_nextButton.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onBoarding_page.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onBoarding_skip.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
   const OnboardingScreen({super.key});
   
  @override
  Widget build(BuildContext context) {
     final  controller=Get.put(OnBoardingController());
     //these will create an instance and we can use it any class and it will be same object 
    return Scaffold(
       body: Stack(
        children: [
               
               PageView(
                controller: controller.pageController,
                onPageChanged: controller.updatePageIndicator,//it will pass the current page index//or(index){
              //                                                                             controller.updatePageIndicator(index)   }  
              children: const [   
                onBoardingPage(image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,),

                onBoardingPage(
                  image: TImages.onBoardingImage2,
                  title:TTexts.onBoardingTitle2 ,
                  subTitle:TTexts.onBoardingSubTitle2 ,),

                 onBoardingPage(
                  image: TImages.onBoardingImage3, 
                  title: TTexts.onBoardingTitle3 , 
                  subTitle: TTexts.onBoardingSubTitle3),
              ],
              ),
                 
                   //Skip Button
                const  OnBoardingSkip(),
                //Dot Navigation Smoothpageindicator
                const OnBoardingDotNavigation(),
                  
                const onBoarding_Next_Button()
        ],
       ), 
    );
  }
}



