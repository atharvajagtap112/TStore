class BrandCategoryModel {
  BrandCategoryModel({
    required this.brandId,
    required this.categoryId,
  });

  String brandId;
  String categoryId;

  /// Factory constructor to create an instance from a JSON object
  factory BrandCategoryModel.fromJson(Map<String, dynamic> json) {
    return BrandCategoryModel(
      brandId: json['brandId'] as String,
      categoryId: json['categoryId'] as String,
    );
  }

  /// Factory constructor to create an instance from a Firebase snapshot
  factory BrandCategoryModel.fromSnapshot(dynamic snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BrandCategoryModel(
      brandId: data['brandId'] as String,
      categoryId: data['categoryId'] as String,
    );
  }

  /// Convert the model to JSON
  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'categoryId': categoryId,
    };
  }
}
