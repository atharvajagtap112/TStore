import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/product/sortable/sortable_product.dart';
import 'package:t_store/features/personalization/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CustomSearchDelegate extends SearchDelegate<dynamic>{
static CustomSearchDelegate get instance =>Get.find();
BrandController brandController=Get.put(BrandController());
final categoryController =Get.put(CategoryController());
  List<Map<String,dynamic>> searchItems=[
    {'name':'Nike', 'id':'1'}, 
    {'name':'Acer', 'id':'10'}, 
    {'name':'Adidas', 'id':'2'}, 
    {'name':'Apple', 'id':'3'}, 
    {'name':'Herman', 'id':'4'}, 
    {'name':'Ikea', 'id':'5'}, 
    {'name':'Jordan', 'id':'6'}, 
    {'name':'Samsung', 'id':'7'}, 
    {'name':'Kenwood', 'id':'8'}, 
    {'name':'Puma', 'id':'9'}, 
    {'name': 'Sports', 'id': '1'},
    {'name': 'Furniture', 'id': '5'},
    {'name': 'Electronics', 'id': '2'},
    {'name': 'Clothes', 'id': '3'},
    {'name': 'Animals', 'id': '4'},
    {'name': 'Shoes', 'id': '6'},
    {'name': 'Cosmetics', 'id': '7'},
    {'name': 'Jewelery', 'id': '14'},
    {'name': 'Sport Shoes', 'id': '8'},
    {'name': 'Track suits', 'id': '9'},
    {'name': 'Sports Equipments', 'id': '10'},
    {'name': 'Bedroom furniture', 'id': '11'},
    {'name': 'Kitchen furniture', 'id': '12'},
    {'name': 'Office furniture', 'id': '13'},
    {'name': 'Laptop', 'id': '14'},
    {'name': 'Mobile', 'id': '15'},
    {'name': 'Shirts', 'id': '16'}
    
  ];


 
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Please enter a search term'));
    }

    return FutureBuilder(
      future: Future.wait([
        _searchBrands(),
        _searchCategories(),
      ]),
      builder: (context, AsyncSnapshot<List<List<ProductModel>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text('No results found'));
        }

        final List<ProductModel> allProducts = [
          ...snapshot.data![0], // Brand products
          ...snapshot.data![1], // Category products
        ];

        return allProducts.isEmpty
          ? const Center(child: Text('No matching products found'))
          : Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: SingleChildScrollView(child: TSortableProducts(product: allProducts)),
          );
      },
    );
  }

  Future<List<ProductModel>> _searchBrands() async {
    try {
      final matchingBrand = brandController.allBrands
          .firstWhere(
            (brand) => brand.name.toLowerCase().contains(query.toLowerCase()),
            orElse: () => BrandModel.empty,
          );

      if (matchingBrand.id.isNotEmpty) {
        return await brandController.getBrandProducts(brandId: matchingBrand.id);
      }
    } catch (e) {
      debugPrint('Brand search error: $e');
    }
    return [];
  }

  Future<List<ProductModel>> _searchCategories() async {
    try {
      final matchingCategory = categoryController.allCategories
          .firstWhere(
            (category) => category.name.toLowerCase().contains(query.toLowerCase()),
            orElse: () => CategoryModel.empty(),
          );

      if (matchingCategory.id.isNotEmpty) {
        return await categoryController.getCategoryProducts(
          categoryId: matchingCategory.id,
        );
      }
    } catch (e) {
      debugPrint('Category search error: $e');
    }
    return [];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = searchItems.where((item) =>
        item['name'].toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion['name']),
          onTap: () {
            query = suggestion['name'];
            showResults(context);
          },
        );
      },
    );
  }
}