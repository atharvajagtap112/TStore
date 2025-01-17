import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:t_store/bindings/general_bindings.dart';
import 'package:t_store/routes/app_routes.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
      debugShowCheckedModeBanner: false,
      darkTheme: TAppTheme.darkTheme,
      theme:  TAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,// now get material app knows which page means what
      home:const  Scaffold( backgroundColor: TColors.primary , body: Center( child: CircularProgressIndicator(color: Colors.white,),),),
    );
  }
}
 