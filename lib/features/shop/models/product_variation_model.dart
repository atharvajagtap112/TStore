class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Create an empty instance for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  /// Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  /// Create a model instance from a JSON map
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data=document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      sku: data['SKU'] ?? '',//stock keeping units
      image: data['Image'] ?? '',
      description: data['Description'] ?? '',
      price: double.parse((data[ 'Price']??0.0).toString()), 
      //double.parse() takes a string (e.g., "99.99") and converts it back into a double.
//This is useful if the incoming value is initially in a non-double format, 
//such as a string from a JSON response that might be represented as "99.99" instead of a numeric 99.99.
//In this case, toString() is a safety step to make sure the value is in a string format that can be correctly 
//parsed into a double. However, if json['SalePrice'] is already a number (e.g., 99.99), calling toString() 
//and then double.parse() is redundant but doesn't cause any issues.
      salePrice: double.parse((data['SalePrice']??0.0).toString() ),
      stock: data['Stock'] ?? 0,
      attributeValues: Map<String,String>.from(data['AttributeValues'])
    );
  }
}
