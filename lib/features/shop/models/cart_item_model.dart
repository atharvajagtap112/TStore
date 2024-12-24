class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  // Constructor
  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = '',
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
  });

  // Empty cart item
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  // Convert the object to a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  // Create an object from a Map (JSON)
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'] ?? '',
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'],
      quantity: json['quantity'] ?? 0,
      variationId: json['variationId'] ?? '',
      brandName: json['brandName'],
      selectedVariation: Map<String, String>.from(json['selectedVariation'] ?? {}),
    );
  }
}
