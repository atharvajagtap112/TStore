import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';

class AddressRepository extends GetxController{
     static AddressRepository get instance=> Get.find();
     final _db=FirebaseFirestore.instance;

  Future<String> addAddress(AddressModel address) async{
      final userId=AuthenticationRepository.instance.authUser!.uid;
   if(userId.isEmpty) {
    throw " User is null";
   }
    final currentAddress=await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
         await  _db.collection('Users').doc(userId).collection('Addresses').doc(currentAddress.id).update({'id': currentAddress.id});
    return currentAddress.id;
  }
  
  
   //Get All Addresses
  Future<List<AddressModel>> getAddress() async{
   
   try {
     final userId=AuthenticationRepository.instance.authUser!.uid;
   if(userId.isEmpty) {
    throw " User is null";
   }
     final snapshot=    await _db.collection('Users').doc(userId).collection('Addresses').get();
     return snapshot.docs.map((document) => AddressModel.fromSnapshot(document)).toList();
      
  }
   catch( e){
      throw 'Something went wrong while fetching Address Information. Try again later'; 
  }
  }
   

  // Update Address 
  Future<void> updateSelectedAddress(String addressId, bool selected) async{
     try {
      final userId=AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) {
    throw " User is null";
   }
     await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update( {'selectedAddress': selected});
     } catch(e){
         throw 'Something went wrong while fetching Address Information. Try again later'; 
     }
  }
}