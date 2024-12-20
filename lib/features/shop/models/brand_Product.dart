
class ProductCategory {
  String categoryId;
  String productId;

  ProductCategory({
    required this.categoryId,
    required this.productId,
  });

  // Convert a BrandCategory object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'productId': productId,
    };
  }

  // Convert a snapshot (map) to a BrandCategory object
  factory ProductCategory.fromSnapshot(Map<String, dynamic> snapshot) {
    return ProductCategory(
      categoryId: snapshot['categoryId'] ?? '',  // Default to empty string if 'brandId' is null
      productId: snapshot['productId'] ?? '',  // Default to empty string if 'productId' is null
    );
  }
}
