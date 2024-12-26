import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/AppBar/appbar.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/singleAddress.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AddressController());
    return  Scaffold(
           floatingActionButton: FloatingActionButton(
            backgroundColor: TColors.primary,
            onPressed: ()=> Get.to(()=> const AddNewAddressScreen()), 
           child:const Icon(Iconsax.add,color: TColors.white,),
           ),

           appBar: TAppBar(showBackArrow: true,
            title: Text('Address',style: Theme.of(context).textTheme.headlineSmall,),),
            body:  SingleChildScrollView(
              child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
              child:Column(
                children: [
                Obx(
                  ()=> FutureBuilder(
                       
                    //use key to trigger refresh 
                     key:Key( controller.refreshData.value.toString()), // these key will not help to redesign we are just using it
                    // when ever there is change in the refreshData it will obserev of obx and change the design thats why we are using 
                    // the key to keep track
                    //when ever the future will be redrawn it will exicute it  the controller.getUserAddresses(), again
                      future: controller.getUserAddresses(),
                      builder: (context, snapshot) {
                        final widget= CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                               if(widget!=null) return widget;
                        final  Addresses=snapshot.data!;
                        return  ListView.builder(
                          shrinkWrap: true,
                          itemCount:Addresses.length ,
                          itemBuilder: (context, index) {
                              return TSingleAddress(Address: Addresses[index] , onTap: () => controller.selectAddress(Addresses[index] ),); 
                        },);
                      }
                    ),
                ),
                 
                ],
              ) ,
              ),
            ),
    );
  }
}