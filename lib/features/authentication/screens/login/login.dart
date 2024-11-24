import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/social_button.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return  Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children:[
               
               //Header 
              Login_Header(dark: dark),
      
              ///Form
               TLoginForm(),

              ///Divider
               TFormDivider(dividerText: TTexts.orSignInWith,dark: dark) ,
               const SizedBox(height: TSizes.spaceBtwItems,),
              
              ///Footer
                TSocialButtons(),

              

              

          ]
        ),
      ) 
      ),
    );
  }
}




