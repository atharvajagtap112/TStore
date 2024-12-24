import 'package:t_store/utils/formatters/formatter.dart';

class AddressModel {
  String id;
  String name;
  String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      phoneNumber: '',
      street: '',
      city: '',
      state: '',
      postalCode: '',
      country: '',
      dateTime: DateTime.now());

  // Convert the object to a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'dateTime': dateTime.toIso8601String(),
      'selectedAddress': selectedAddress,
    };
  }

  // Create an object from a Map
  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      street: map['street'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      postalCode: map['postalCode'] ?? '',
      country: map['country'] ?? '',
      dateTime: DateTime.parse(map['dateTime']),
      selectedAddress: map['selectedAddress'] ?? true,
    );
  }

  // Create an object from Firestore snapshot
  factory AddressModel.fromSnapshot(dynamic snapshot) {
    final map = snapshot.data() as Map<String, dynamic>;
    return AddressModel.fromMap(map);
  }

   @override
     String toString(){
     return '$street, $city, $state, $postalCode, $country ';
   }
}
