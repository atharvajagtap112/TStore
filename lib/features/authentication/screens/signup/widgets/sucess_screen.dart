import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/utils/constants/sizes.dart';


class SucessScreen extends StatelessWidget {
  const SucessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});
  final String image,title,subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Lottie.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.8, // Display Lottie animation
          ),
  
  const SizedBox( height: TSizes.spaceBtwSections,),
/// Title & SubTitle
Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
const SizedBox( height: TSizes.spaceBtwItems,),

Text(subtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center),
const SizedBox(height: TSizes.spaceBtwSections,),

/// Buttons
 SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text('continue')),),
            ]
          ),
        )),
    );
  }
}