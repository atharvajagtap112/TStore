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
  DateTime? date;
  double salePrice;
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
     this.date,
     this.salePrice=0.0,
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

   static ProductModel get empty => ProductModel(
    id: '',
    stock: 0,
    
    price: 0.0,
    title: '',
    thumbnail: '',
    productType: ''
   );




  // Convert a ProductModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Stock': stock,
      'SKU': sku,
      'Price': price,
      'Title': title,
      
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand?.toJson(),
      'Description': description,
      'CategoryId': categoryId,
      'Images': images ??[],
      'ProductType': productType,
      'ProductAttributes':productAttributes!=null ?productAttributes!.map((e) => e.tojson()).toList():[],
      'ProductVariations':productVariations!=null ?productVariations!.map((e) => e.toJson()).toList():[],
    };
  }

 
  
  // Create a ProductModel instance from a Firestore DocumentSnapshot
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
      if(document.data()==null) return ProductModel.empty;
    final data=document.data()!;
   
     return ProductModel(
      id: document.id,
      stock: data['Stock']??0,
      sku: data['SKU'],
      price: double.parse((data[ 'Price']??0.0).toString()),
      title: data['Title'],
   
      salePrice: double.parse((data[ 'SalePrice']??0.0).toString()),
      thumbnail: data['Thumbnail']??'',
      isFeatured: data['IsFeatured']??false,
      brand:  BrandModel.fromJson(data['Brand']) ,// these will return json in the formate of map
      description: data['Description']??'',
      categoryId: data['CategoryId']??'',
      images: data['Images'] !=null? List<String>.from(data['Images']):[],
      productType: data['ProductType']??'',
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(), 
       //(data['ProductAttributes'] will contain the list of json formate 
            // in the Map not in snapshot 
       
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }

    // Create a list of ProductModel instances from a Firestore QuerySnapshot
  factory ProductModel.fromQuerySnapshot ( QueryDocumentSnapshot<Object?> document) {
       final data =document.data() as Map<String,dynamic>;
        return ProductModel(
      id: document.id,
      stock: data['Stock']??0,
      sku: data['SKU'],
      price: double.parse((data[ 'Price']??0.0).toString()),
      title: data['Title'],
   
      salePrice: double.parse((data[ 'SalePrice']??0.0).toString()),
      thumbnail: data['Thumbnail']??'',
      isFeatured: data['IsFeatured']??false,
      brand:  BrandModel.fromJson(data['Brand']) ,// these will return json in the formate of map
      description: data['Description']??'',
      categoryId: data['CategoryId']??'',
      images: data['Images'] !=null? List<String>.from(data['Images']):[],
      productType: data['ProductType']??'',
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(), 
       //(data['ProductAttributes'] will contain the list of json formate 
            // in the Map not in snapshot 
       
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }
}