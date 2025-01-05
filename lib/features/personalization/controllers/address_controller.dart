import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/t_loader.dart';
import 'package:t_store/common/widgets/selection_heading.dart';
import 'package:t_store/data/repositories/Address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/singleAddress.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_function.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class AddressController extends GetxController {

final Rx<AddressModel> selectedAddress=AddressModel.empty().obs;
static AddressController get instance=>Get.find();

final addressRepository=AddressRepository(); 

RxBool refreshData=false.obs;

final name=TextEditingController();
final phoneNumber=TextEditingController();
final street=TextEditingController();
final postalCode=TextEditingController();
final city=TextEditingController();
final state=TextEditingController();
final country=TextEditingController();
GlobalKey<FormState> addressFormKey=GlobalKey<FormState>();



  Future addNewAddress()async {
          try{
    TFUILScreenLoader.openLoadingDialog('Storing Address...', TImages.docer);
      final bool isConneted= await NetworkManager.instance.isConnected();
      if(!isConneted){
       TFUILScreenLoader.stopLoading();
        return;
      }

     if(!addressFormKey.currentState!.validate()){
            TFUILScreenLoader.stopLoading();
            return;
     }
     
     final AddressModel address=AddressModel(
      id: '',
      name: name.text.trim(),
      phoneNumber: phoneNumber.text.trim(), 
      street: street.text.trim(),
      city: city.text.trim(),
      state: state.text.trim(),
      postalCode: postalCode.text.trim(), 
      country: country.text.trim(),
      dateTime: DateTime.now(),
      selectedAddress: true
      );
      

      final id= await addressRepository.addAddress(address);
       
       //Update Selected Address Status
      address.id=id;
        if(selectedAddress.value.id.isNotEmpty){
         await addressRepository.updateSelectedAddress(selectedAddress.value.id, false);
       }
      selectedAddress.value=address;
     
     // Remove Loader
     TFUILScreenLoader.stopLoading();
      
     //show success Message
     TLoader.successSnackBar(title: 'Congratulation', message: 'Your address has been saved successfully.');

     // Refresh Addresses Data
      refreshData.toggle();// since it is of type bool we can use toggle it will toggle
      //when ever these will change from true to false our design should ne regenerate 


      //Reset field
      resetFormField();
     
     //Redirect
      Navigator.of(Get.context!).pop();

          } catch(e){
           TFUILScreenLoader.stopLoading();
            TLoader.errorSnackBar(title: 'Address not found' , message: e.toString());
          }

   }
   

    // get All user Addresses
    Future<List<AddressModel>> getAllUserAddresses()async {
      try{
        final  List<AddressModel> addresses= await addressRepository.getAddress();
           selectedAddress.value= addresses.firstWhere((element)=> element.selectedAddress, orElse:()=> AddressModel.empty());
        return addresses;
     } catch(e){
      TLoader.errorSnackBar(title: 'OhSnap', message: e.toString());
       return [];
     } 
    
         }


Future<dynamic> selectNewAddressPopup(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true, // Add this to allow modal to expand
    context: context,
    builder: (_) => Container(
      // Add padding to account for bottom safe area
      padding: EdgeInsets.only(
        top: TSizes.lg,
        left: TSizes.lg,
        right: TSizes.lg,
        bottom: MediaQuery.of(context).viewPadding.bottom + TSizes.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Add this to make column wrap content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TSelectionHeading(
            title: 'Select Address',
            showActionButton: false,
          ),
          const SizedBox(height: TSizes.md),
          FutureBuilder(
            future: getAllUserAddresses(),
            builder: (_, snapshot) {
              final response = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
              if (response != null) return response;

              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5, // Limit height to 50% of screen
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => TSingleAddress(
                    Address: snapshot.data![index],
                    onTap: () async {
                      await selectAddress(snapshot.data![index]);
                      Get.back();
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: TSizes.md),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const AddNewAddressScreen()),
              child: const Text('Add new address'),
            ),
          ),
        ],
      ),
    ),
  );
}



    Future<void> selectAddress(AddressModel newSelectedAddress) async{
      try{
           Get.defaultDialog(
            title: '',
            onWillPop: () async {return false;},
            barrierDismissible: false,
            backgroundColor: Colors.transparent,
            content: const CircularProgressIndicator( )

           ); 
       
       // Clear the "selected" field
       if(selectedAddress.value.id.isNotEmpty){
         await addressRepository.updateSelectedAddress(selectedAddress.value.id, false);
       }
            
            //Assign selected address
            newSelectedAddress.selectedAddress=true;
            selectedAddress.value=newSelectedAddress;
         await addressRepository.updateSelectedAddress(newSelectedAddress.id, true);  
         Get.back();
          
          } catch(e){
      TLoader.errorSnackBar(title: 'OhSnap', message: e.toString());
      
     } 
    }     
     

     void resetFormField(){
      name.clear();
      phoneNumber.clear();
      street.clear();
      postalCode.clear();
      city.clear();
      state.clear();
      country.clear();
      addressFormKey.currentState?.reset();
     }
 }