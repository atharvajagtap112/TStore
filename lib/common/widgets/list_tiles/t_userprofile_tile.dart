import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/image/t_circular_image.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:get/get.dart';
class TUserprofileTile extends StatelessWidget {
  const TUserprofileTile({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;

    return ListTile(
     leading:  Obx(()=> TCircularImage(image:  controller.user.value.profilePicture.isNotEmpty?  
      controller.user.value.profilePicture :TImages.user ,
      isNetworkImage: controller.user.value.profilePicture.isNotEmpty, height: 50,width: 50,padding: 0,)),
     title: Obx(()=> Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),)),
     subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white,), ),
     trailing: IconButton(onPressed: ()=>Get.to(()=>const ProfileScreen()), icon:const  Icon(Iconsax.edit,color: TColors.white,)),
    );
  }
}