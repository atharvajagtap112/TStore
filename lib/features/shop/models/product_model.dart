import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime date;
  double? salePrice;
  String? thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    required this.date,
    this.salePrice,
    this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  // Convert a ProductModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Stock': stock,
      'SKU': sku,
      'Price': price,
      'Title': title,
      'Date': date.toIso8601String(),
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand?.toJson(),
      'Description': description,
      'CategoryId': categoryId,
      'Images': images,
      'ProductType': productType,
      'ProductAttributes':productAttributes!=null ?productAttributes?.map((e) => e.tojson()).toList():[],
      'ProductVariations':productVariations!=null ?productVariations?.map((e) => e.toJson()).toList():[],
    };
  }

 
  
  // Create a ProductModel instance from a Firestore DocumentSnapshot
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> doc) {
    final data=doc.data()!;
   
     return ProductModel(
      id: doc.id,
      stock: data['Stock']??0,
      sku: data['SKU'],
      price: double.parse((data[ 'Price']??0.0).toString()),
      title: data['Title'],
      date: DateTime.parse(data['Date']),
      salePrice: double.parse((data[ 'SalePrice']??0.0).toString()),
      thumbnail: data['Thumbnail']??'',
      isFeatured: data['IsFeatured']??false,
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,// these will return json in the formate of map
      description: data['Description']??'',
      categoryId: data['CategoryId']??'',
      images: data['Images'] !=null? List<String>.from(data['Images']):[],
      productType: data['ProductType']??'',
      productAttributes: (data['ProductAttributes'] as List<dynamic>?) //(data['ProductAttributes'] will contain the list of json formate 
       ?.map((e) => ProductAttributeModel.fromJson(e))             // in the Map not in snapshot 
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>?)
          ?.map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }

    // Create a list of ProductModel instances from a Firestore QuerySnapshot
  static List<ProductModel> fromQuerySnapshot(
      QuerySnapshot<Map<String, dynamic>> querySnapshot) {
    return querySnapshot.docs
        .map((doc) => ProductModel.fromSnapshot(doc))
        .toList();
  }
}