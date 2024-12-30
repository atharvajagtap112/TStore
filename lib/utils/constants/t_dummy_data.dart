import 'package:t_store/features/shop/models/BrandCategoryModel.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/features/shop/models/brand_Product.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_variation_model.dart';
import 'package:t_store/routes/routes.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TDummyData {
   // List of Banners

static List<BannerModel> banners =[
  BannerModel(name: 'order' ,imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
  BannerModel( name: 'cart',imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
  BannerModel( name: 'favourites',imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
  BannerModel(name:'search' ,imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
  BannerModel(name: 'setting' ,imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
  BannerModel(name:'userAddress' , imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
  BannerModel(name:'checkout' ,imageUrl: TImages.banner6, targetScreen: TRoutes.checkout, active: false),
  
  
];


  // List of all Categories
static final List<CategoryModel> categories = [
CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
CategoryModel(id: '5', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
CategoryModel(id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
CategoryModel(id: '4', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
CategoryModel(id: '14', image: TImages.jeweleryIcon, name: "Jewelery", isFeatured: true),

///subcategories
CategoryModel(id: '8', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
CategoryModel(id: '9', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
CategoryModel(id: '10', image: TImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),

//furniture
CategoryModel(id: '11', image: TImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
CategoryModel(id: '12', image: TImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
CategoryModel(id: '13', image: TImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),

//electronics
CategoryModel(id: '14', image: TImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
CategoryModel(id: '15', image: TImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),

CategoryModel(id: '16', image: TImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),


];


// static final List<ProductModel> products = [
//   ProductModel(
//     id: '001',
//     title: 'Green Nike sports shoe',
//     stock: 15,
//     price: 135.0,
//     isFeatured: true,
//     thumbnail: TImages.productImage1,
//     description: 'Green Nike sports shoe',
//     brand: BrandModel(
//       id: '1',
//       image: TImages.nikeLogo,
//       name: 'Nike',
//       productCount: 265,
//       isFeatured: true,
//     ),
//     images: [
//       TImages.productImage1,
//       TImages.productImage25,
//       TImages.productImage21,
//       TImages.productImage9,
//     ],
//     salePrice: 30.0,
//     sku: 'ABR4568',
//     categoryId: '1',
//     productAttributes: [
//       ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
//       ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//     ],
//     productVariations: [
//       ProductVariationModel(
//         id: '1',
//         stock: 34,
//         price: 134.0,
//         salePrice: 122.6,
//         image: TImages.productImage1,
//         description: 'This is a product description for Green Nike sports shoe.',
//         attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
//       ),
//       ProductVariationModel(
//         id: '2',
//         stock: 15,
//         price: 152.0,
//         image: TImages.productImage23,
//         attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
//       ),
//       ProductVariationModel(
//         id: '3',
//         stock: 0,
//         price: 234.0,
//         image: TImages.productImage23,
//         attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
//       ),
//       ProductVariationModel(
//         id: '4',
//         stock: 222,
//         price: 252.0,
//         image: TImages.productImage1,
//         attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
//       ),
//       ProductVariationModel(
//         id: '5',
//         stock: 0,
//         price: 334.0,
//         image: TImages.productImage21,
//         attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
//       ),
//       ProductVariationModel(
//         id: '6',
//         stock: 11,
//         price: 332.0,
//         image: TImages.productImage21,
//         attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
//       ),
//     ], productType: 'ProductType.variable',
//   ),


//  ProductModel(
//     id: '002',
//     title: 'Blue T-shirt for all ages',
//     stock: 15,
//     price: 35.0,
//     isFeatured: true,
//     thumbnail: TImages.productImage69,
//     description: 'This is a Product description for Blue Nike Sleeveless vest. There are more things that can be added but I am just practicing and nothing else.',
//     brand: BrandModel(
//       id: '5',
//       image: TImages.zaraLogo,
//       name: 'ZARA',
//     ),
//     images: [
//       TImages.productImage68,
//       TImages.productImage69,
//       TImages.productImage5,
//     ],
//     salePrice: 30.0,
//     sku: 'ABR4568',
//     categoryId: '16',
//     productAttributes: [
//       ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//       ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//     ],
//     productType: 'ProductType.single',
//   ),
//   ProductModel(
//     id: '003',
//     title: 'Leather brown Jacket',
//     stock: 15,
//     price: 38000,
//     isFeatured: false,
//     thumbnail: TImages.productImage64,
//     description: 'This is a Product description for Leather brown Jacket. There are more things that can be added but I am just practicing and nothing else.',
//     brand: BrandModel(
//       id: '6',
//       image: TImages.zaraLogo,
//       name: 'ZARA',
//     ),
//     images: [
//       TImages.productImage64,
//       TImages.productImage65,
//       TImages.productImage66,
//       TImages.productImage67,
//     ],
//     salePrice: 30.0,
//     sku: 'ABR4568',
//     categoryId: '16',
//     productAttributes: [
//       ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//       ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//     ],
//     productType: 'ProductType.single',
//   ),
//   ProductModel(
//     id: '004',
//     title: '4 Color collar t-shirt dry fit',
//     stock: 15,
//     price: 135,
//     isFeatured: false,
//     thumbnail: TImages.productImage60,
//     description: 'This is a product description for 4 color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else',
//     brand: BrandModel(
//       id: '6',
//       image: TImages.zaraLogo,
//       name: 'ZARA',
//     ),
//     images: [TImages.productImage60,TImages.productImage61,TImages.productImage62,TImages.productImage63 ],
//     salePrice: 30,
//     sku: 'ABR4568',
//     categoryId: '16',
//     productAttributes: [ 
//       ProductAttributeModel(name : 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
//       ProductAttributeModel(name : 'Size', values: ['EU 30', 'EU 32 ', 'EU 34'])
//      ],
//     productVariations: [
//       ProductVariationModel(
//         id: '1', 
//         stock: 34,
//         price: 134,
//         salePrice: 122.6,
//         image: TImages.productImage60,
//         description: 'This is a product description for 4 Color collar t-shirt dry fit',
//         attributeValues: { 'Colors':'Red', 'Size':'EU 34'}),

//         ProductVariationModel(id: '2', stock: 15, price: 132,image: TImages.productImage60,attributeValues: {'Color':'Red' ,'Size':'EU 32'}),
//         ProductVariationModel(id: '3', stock: 0, price: 132,image: TImages.productImage61,attributeValues: {'Color':'Yellow' ,'Size':'EU 34'}),
//         ProductVariationModel(id: '4', stock: 12, price: 100,image: TImages.productImage62,attributeValues: {'Color':'Yellow' ,'Size':'EU 34'}),
//         ProductVariationModel( id: '5',stock: 0, price: 334,image: TImages.productImage63,attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
// ), // ProductVariationModel

// ProductVariationModel(
//   id: '6',
//   stock: 11,
//   price: 332,
//   image: TImages.productImage64,
//   attributeValues: {'Color': 'Green', 'Size': 'EU 30'},
// ), // ProductVariationModel

// ProductVariationModel(
//   id: '7',
//   stock: 8,
//   price: 334,
//   image: TImages.productImage65,
//   attributeValues: {'Color': 'Blue', 'Size': 'EU 30'},
// ), // ProductVariationModel

// ProductVariationModel(
//   id: '8',
//   stock: 11,
//   price: 332,
//   image: TImages.productImage66,
//   attributeValues: {'Color': 'Blue', 'Size': 'EU 34'},
// ), // ProductVariationModel 
//     ],
//     productType: 'ProductType.variable',
//   ),
 

//    ProductModel(
//     id: '005',
//     title: 'Nike Air Jordan Shoes',
//     stock: 15,
//     price: 35,
//     isFeatured: false,
//     thumbnail: TImages.productImage10,
//     description: 'This is a product description for 4 color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else',
//     brand: BrandModel(
//       id: '1',
//       image: TImages.nikeLogo,
//       name: 'Nike',
//       productCount: 256,
//       isFeatured: true
//     ),
//     images: [TImages.productImage7,TImages.productImage8,TImages.productImage9,TImages.productImage10 ],
//     salePrice: 30,
//     sku: 'ABR4568',
//     categoryId: '8',
//     productAttributes: [ 
//       ProductAttributeModel(name : 'Color', values: ['Orange', 'Black', 'Brown']),
//       ProductAttributeModel(name : 'Size', values: ['EU 30', 'EU 32 ', 'EU 34'])
//      ],
//     productVariations: [
//       ProductVariationModel(
//         id: '1', 
//         stock: 16,
//         price: 36,
//         salePrice: 12.6,
//         image: TImages.productImage8,
//         description: 'This is a product description for 4 Color collar t-shirt dry fit',
//         attributeValues: { 'Colors':'Red', 'Size':'EU 34'}),

//         ProductVariationModel(id: '2', stock: 15, price: 35,image: TImages.productImage7,attributeValues: {'Color':'Black' ,'Size':'EU 32'}),
//         ProductVariationModel(id: '3', stock: 15, price: 34,image: TImages.productImage9,attributeValues: {'Color':'Brown' ,'Size':'EU 34'}),
//         ProductVariationModel(id: '4', stock: 13, price: 33,image: TImages.productImage7,attributeValues: {'Color':'Black' ,'Size':'EU 34'}),
//         ProductVariationModel( id: '5',stock:12, price: 32,image: TImages.productImage9,attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
//         ProductVariationModel( id: '6',stock:11, price: 32,image: TImages.productImage8,attributeValues: {'Color': 'Brown', 'Size': 'EU 32'},), // ProductVariationModel
//    ],
//     productType: 'ProductType.variable',
//   ),
     
//      ProductModel(
//   id: '006',
//   title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM)',
//   stock: 15,
//   price: 750,
//   isFeatured: false,
//   thumbnail: TImages.productImage11,
//   description: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
//   brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Samsung'),
//   images: [
//     TImages.productImage11,
//     TImages.productImage12,
//     TImages.productImage13,
//     TImages.productImage12,
//   ],
//   salePrice: 650,
//   sku: 'ABR4568',
//   categoryId: '2',
//   productAttributes: [
//     ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//     ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//   ],
//   productType: 'ProductType.single',
// ),

// ProductModel(
//   id: '007',
//   title: 'TOMI Dog food',
//   stock: 25,
//   price: 20,
//   isFeatured: false,
//   thumbnail: TImages.productImage18,
//   description: 'This is a Product description for TOMI Dog food. There are more things that can be added but I am just practicing and nothing else.',
//   brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Tomi'),
//   salePrice: 10,
//   sku: 'ABR4568',
//   categoryId: '4',
//   productAttributes: [
//     ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//     ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//   ],
//   productType: 'ProductType.single',
// ),

// ProductModel(
//   id: '009',
//   title: 'Nike Air Jordon 19 Blue',
//   stock: 15,
//   price: 400,
//   isFeatured: false,
//   thumbnail: TImages.productImage19,
//   description:
//       'This is a Product description for Nike Air Jordon. There are more things that can be added but I am just practicing and nothing else.',
//   brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
//   images: [
//     TImages.productImage19,
//     TImages.productImage20,
//     TImages.productImage21,
//     TImages.productImage22
//   ],
//   salePrice: 200,
//   sku: 'ABR4568',
//   categoryId: '8',
//   productAttributes: [
//     ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//     ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//   ],
//   productType: 'ProductType.single',
// ),





// ];



// static final List<ProductModel> products = [
// ProductModel(
//   id: '010',
//   title: 'Nike Wildhorse Trail Running Shoes',
//   stock: 25,
//   price: 180,
//   isFeatured: false,
//   thumbnail: TImages.productImage23,
//   description: 'Nike Wildhorse Trail Running Shoes designed for rough terrain and long-distance comfort.',
//   brand: BrandModel(
//     id: '1',
//     image: TImages.nikeLogo,
//     name: 'Nike',
//     productCount: 289,
//     isFeatured: true,
//   ),
//   images: [TImages.productImage23],
//   salePrice: 150,
//   sku: 'NKWH4568',
//   categoryId: '8', // Assuming this is shoes category
//   productAttributes: [
//     ProductAttributeModel(name: 'Size', values: ['EU 40', 'EU 41', 'EU 42', 'EU 43']),
//     ProductAttributeModel(name: 'Color', values: ['Green', 'Black']),
//   ],
//   productType: 'ProductType.single',
// ),

// ProductModel(
//   id: '011',
//   title: 'Nike Basketball Shoe Green/Black',
//   stock: 20,
//   price: 190,
//   isFeatured: false,
//   thumbnail: TImages.productImage22,
//   description: 'Professional basketball shoes with enhanced grip and ankle support.',
//   brand: BrandModel(
//     id: '1',
//     image: TImages.nikeLogo,
//     name: 'Nike',
//     productCount: 289,
//     isFeatured: true,
//   ),
//   images: [TImages.productImage22],
//   salePrice: 170,
//   sku: 'NKBB4569',
//   categoryId: '8',
//   productAttributes: [
//     ProductAttributeModel(name: 'Size', values: ['EU 40', 'EU 41', 'EU 42', 'EU 43']),
//     ProductAttributeModel(name: 'Color', values: ['Green/Black']),
//   ],
//   productType: 'ProductType.single',
// ),

// ProductModel(
//   id: '012',
//   title: 'Premium Tracksuit Collection',
//   stock: 45,
//   price: 120,
//   isFeatured: true,
//   thumbnail: TImages.productImage24,
//   description: 'Premium quality tracksuits available in multiple colors. Perfect for sports and casual wear.',
//   brand: BrandModel(
//     id: '2',
//     image: TImages.adidasLogo,
//     name: 'Adidas',
//     productCount: 345,
//     isFeatured: true,
//   ),
//   images: [
//     TImages.productImage24,
//     TImages.productImage25,
//     TImages.productImage26,
//     TImages.productImage27,
//   ],
//   salePrice: 99,
//   sku: 'TRK4570',
//   categoryId: '9', // Assuming this is tracksuit category
//   productAttributes: [
//     ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
//     ProductAttributeModel(name: 'Color', values: ['Black', 'Blue', 'Red', 'Green']),
//   ],
//   productVariations: [
//     ProductVariationModel(
//       id: '1',
//       stock: 15,
//       price: 120,
//       image: TImages.productImage24,
//       attributeValues: {'Color': 'Black', 'Size': 'M'},
//     ),
//     ProductVariationModel(
//       id: '2',
//       stock: 10,
//       price: 120,
//       image: TImages.productImage25,
//       attributeValues: {'Color': 'Blue', 'Size': 'M'},
//     ),
//     ProductVariationModel(
//       id: '3',
//       stock: 12,
//       price: 120,
//       image: TImages.productImage26,
//       attributeValues: {'Color': 'Red', 'Size': 'M'},
//     ),
//     ProductVariationModel(
//       id: '4',
//       stock: 8,
//       price: 120,
//       image: TImages.productImage27,
//       attributeValues: {'Color': 'Green', 'Size': 'M'},
//     ),
//   ],
//   productType: 'ProductType.variable',
// ),

//  ];




// static final List<ProductModel> products = [
// ProductModel(
//   id: '013',
//   title: 'Adidas Professional Football',
//   stock: 50,
//   price: 45,
//   isFeatured: false,
//   thumbnail: TImages.productImage28,
//   description: 'Professional grade football from Adidas, perfect for matches and training.',
//   brand: BrandModel(
//     id: '2',
//     image: TImages.adidasLogo,
//     name: 'Adidas',
//     productCount: 345,
//     isFeatured: true,
//   ),
//   images: [TImages.productImage28],
//   salePrice: 40,
//   sku: 'ADF4571',
//   categoryId: '10', // Sports Equipment
//   productAttributes: [
//     ProductAttributeModel(name: 'Size', values: ['5']),
//     ProductAttributeModel(name: 'Color', values: ['White/Black']),
//   ],
//   productType: 'ProductType.single',
// ),

// ProductModel(
//   id: '014',
//   title: 'Professional Baseball Bat',
//   stock: 30,
//   price: 85,
//   isFeatured: false,
//   thumbnail: TImages.productImage29,
//   description: 'High-quality baseball bat for professional and amateur players.',
//   brand: BrandModel(
//     id: '4',
//     image: TImages.hermanMillerLogo,
//     name: 'Herman',
//     productCount: 111,
//     isFeatured: false,
//   ),
//   images: [TImages.productImage29],
//   salePrice: 75,
//   sku: 'BBT4572',
//   categoryId: '10', // Sports Equipment
//   productAttributes: [
//     ProductAttributeModel(name: 'Size', values: ['34"', '32"']),
//     ProductAttributeModel(name: 'Material', values: ['Wood', 'Aluminum']),
//   ],
//   productType: 'ProductType.single',
// ),

// ProductModel(
//   id: '015',
//   title: 'Premium Cricket Bat',
//   stock: 25,
//   price: 120,
//   isFeatured: false,
//   thumbnail: TImages.productImage30,
//   description: 'Professional grade cricket bat for competitive players.',
//   brand: BrandModel(
//     id: '4',
//     image: TImages.hermanMillerLogo,
//     name: 'Herman',
//     productCount: 111,
//     isFeatured: false,
//   ),
//   images: [TImages.productImage30],
//   salePrice: 100,
//   sku: 'CKT4573',
//   categoryId: '10', // Sports Equipment
//   productAttributes: [
//     ProductAttributeModel(name: 'Weight', values: ['2.8 lbs', '2.9 lbs', '3.0 lbs']),
//     ProductAttributeModel(name: 'Size', values: ['Short Handle', 'Long Handle']),
//   ],
//   productType: 'ProductType.single',
// ),

// // Now adding some bedroom furniture
// ProductModel(
//   id: '016',
//   title: 'Modern Bedroom Collection',
//   stock: 15,
//   price: 1200,
//   isFeatured: true,
//   thumbnail: TImages.productImage32,
//   description: 'Complete bedroom set including bed, wardrobe, and bedside accessories.',
//   brand: BrandModel(
//     id: '5',
//     image: TImages.ikeaLogo,
//     name: 'Ikea',
//     productCount: 450,
//     isFeatured: false,
//   ),
//   images: [
//     TImages.productImage43,
//     TImages.productImage44,
//     TImages.productImage45,
//     TImages.productImage46,
//   ],
//   salePrice: 999,
//   sku: 'BED4574',
//   categoryId: '11', // Bedroom Furniture
//   productAttributes: [
//     ProductAttributeModel(name: 'Size', values: ['King', 'Queen', 'Single']),
//     ProductAttributeModel(name: 'Color', values: ['Black', 'Grey', 'Brown']),
//   ],
//   productVariations: [
//     ProductVariationModel(
//       id: '1',
//       stock: 5,
//       price: 1200,
//       image: TImages.productImage43,
//       attributeValues: {'Color': 'Black', 'Size': 'King'},
//     ),
//     ProductVariationModel(
//       id: '2',
//       stock: 5,
//       price: 1100,
//       image: TImages.productImage44,
//       attributeValues: {'Color': 'Grey', 'Size': 'Queen'},
//     ),
//     ProductVariationModel(
//       id: '3',
//       stock: 5,
//       price: 900,
//       image: TImages.productImage45,
//       attributeValues: {'Color': 'Brown', 'Size': 'Single'},
//     ),
//   ],
//   productType: 'ProductType.variable',
// ),

// // Adding Acer Laptop series
// ProductModel(
//   id: '017',
//   title: 'Acer Premium Laptop Series',
//   stock: 30,
//   price: 1500,
//   isFeatured: true,
//   thumbnail: TImages.productImage47,
//   description: 'High-performance Acer laptop with latest specifications and features.',
//   brand: BrandModel(
//     id: '10',
//     image: TImages.acerlogo,
//     name: 'Acer',
//     productCount: 785,
//     isFeatured: false,
//   ),
//   images: [
//     TImages.productImage47,
//     TImages.productImage48,
//     TImages.productImage49,
//     TImages.productImage50,
//   ],
//   salePrice: 1299,
//   sku: 'ACR4575',
//   categoryId: '14', // Laptops
//   productAttributes: [
//     ProductAttributeModel(name: 'RAM', values: ['8GB', '16GB', '32GB']),
//     ProductAttributeModel(name: 'Storage', values: ['256GB', '512GB', '1TB']),
//     ProductAttributeModel(name: 'Color', values: ['Silver', 'Black']),
//   ],
//   productVariations: [
//     ProductVariationModel(
//       id: '1',
//       stock: 10,
//       price: 1500,
//       image: TImages.productImage47,
//       attributeValues: {'RAM': '16GB', 'Storage': '512GB', 'Color': 'Silver'},
//     ),
//     ProductVariationModel(
//       id: '2',
//       stock: 5,
//       price: 1800,
//       image: TImages.productImage48,
//       attributeValues: {'RAM': '32GB', 'Storage': '1TB', 'Color': 'Black'},
//     ),
//   ],
//   productType: 'ProductType.variable',
// ),
// ];

static final List<ProductModel> products = [
ProductModel(
  id: '018',
  title: 'iPhone 12 Collection',
  stock: 40,
  price: 999,
  isFeatured: true,
  thumbnail: TImages.productImage70,
  description: 'Latest iPhone 12 with A14 Bionic chip, available in multiple colors.',
  brand: BrandModel(
    id: '3',
    image: TImages.appleLogo,
    name: 'Apple',
    productCount: 344,
    isFeatured: true,
  ),
  images: [
    TImages.productImage70,
    TImages.productIphoneBlue,
    TImages.productIphoneGreen,
    TImages.productImage73,
  ],
  salePrice: 899,
  sku: 'IPH4576',
  categoryId: '15', // Mobile Phones
  productAttributes: [
    ProductAttributeModel(name: 'Storage', values: ['128GB', '256GB', '512GB']),
    ProductAttributeModel(name: 'Color', values: ['Red', 'Blue', 'Green', 'Black']),
  ],
  productVariations: [
    ProductVariationModel(
      id: '1',
      stock: 10,
      price: 999,

      image: TImages.productImage70Iphone12Red,
      attributeValues: {'Storage': '128GB', 'Color': 'Red'},
    ),
    ProductVariationModel(
      id: '2',
      stock: 10,
      price: 1099,
      image: TImages.productIphoneBlue,
      attributeValues: {'Storage': '256GB', 'Color': 'Blue'},
    ),
    ProductVariationModel(
      id: '3',
      stock: 10,
      price: 1199,
      image: TImages.productIphoneGreen,
      attributeValues: {'Storage': '512GB', 'Color': 'Green'},
    ),
     ProductVariationModel(
    id: '4',
    stock: 10,
    price: 999,
    image: TImages.productImage73Iphone12Black,
    attributeValues: {'Storage': '128GB', 'Color': 'Black'},
  ),
  ProductVariationModel(
    id: '5',
    stock: 10,
    price: 1099,
    image: TImages.productImage70Iphone12Red,
    attributeValues: {'Storage': '256GB', 'Color': 'Red'},
  ),
  ProductVariationModel(
    id: '6',
    stock: 10,
    price: 1099,
    image: TImages.productIphoneBlue,
    attributeValues: {'Storage': '256GB', 'Color': 'Blue'},
  ),
  ProductVariationModel(
    id: '7',
    stock: 10,
    price: 1099,
    image: TImages.productIphoneGreen,
    attributeValues: {'Storage': '256GB', 'Color': 'Green'},
  ),
  ProductVariationModel(
    id: '8',
    stock: 10,
    price: 1099,
    image: TImages.productImage73Iphone12Black,
    attributeValues: {'Storage': '256GB', 'Color': 'Black'},
  ),
  ProductVariationModel(
    id: '9',
    stock: 10,
    price: 1199,
    image: TImages.productImage70Iphone12Red,
    attributeValues: {'Storage': '512GB', 'Color': 'Red'},
  ),
  ProductVariationModel(
    id: '10',
    stock: 10,
    price: 1199,
    image: TImages.productIphoneBlue,
    attributeValues: {'Storage': '512GB', 'Color': 'Blue'},
  ),
  ProductVariationModel(
    id: '11',
    stock: 10,
    price: 1199,
    image: TImages.productIphoneGreen,
    attributeValues: {'Storage': '512GB', 'Color': 'Green'},
  ),
  ProductVariationModel(
    id: '12',
    stock: 10,
    price: 1199,
    image:  TImages.productImage73Iphone12Black,
    attributeValues: {'Storage': '512GB', 'Color': 'Black'},
  ),
  ],
  productType: 'ProductType.variable',
),

// Kitchen Furniture
ProductModel(
  id: '019',
  title: 'Modern Kitchen Collection',
  stock: 10,
  price: 2500,
  isFeatured: true,
  thumbnail: TImages.productImage36,
  description: 'Complete kitchen furniture set including counter, dining table, and storage.',
  brand: BrandModel(
    id: '5',
    image: TImages.ikeaLogo,
    name: 'Ikea',
    productCount: 450,
    isFeatured: false,
  ),
  images: [
    TImages.productImage36,
    TImages.productImage37,
    TImages.productImage38,
  ],
  salePrice: 2200,
  sku: 'KIT4577',
  categoryId: '12', // Kitchen Furniture
  productAttributes: [
    ProductAttributeModel(name: 'Type', values: ['Counter', 'Dining Table', 'Refrigerator']),
    ProductAttributeModel(name: 'Color', values: ['White', 'Grey', 'Brown']),
  ],
   productVariations: [
     ProductVariationModel(
      id: '1',
      stock: 3,
      price: 2500,
      salePrice: 2200,
      image: TImages.product36Counter,
      attributeValues: {'Type': 'Counter', 'Color': 'White'},
    ),
    ProductVariationModel(
      id: '2',
      stock: 3,
      price: 2500,
      salePrice: 2200,
      image: TImages.product36Counter,
      attributeValues: {'Type': 'Counter', 'Color': 'Grey'},
    ),
    ProductVariationModel(
      id: '3',
      stock: 4,
      price: 2500,
      salePrice: 2200,
      image: TImages.product36Counter,
      attributeValues: {'Type': 'Counter', 'Color': 'Brown'},
    ),
    ProductVariationModel(
      id: '4',
      stock: 3,
      price: 2500,
      salePrice: 2200,
      image: TImages.product37DiningTable,
      attributeValues: {'Type': 'Dining Table', 'Color': 'White'},
    ),
    ProductVariationModel(
      id: '5',
      stock: 3,
      price: 2500,
      salePrice: 2200,
      image: TImages.product37DiningTable,
      attributeValues: {'Type': 'Dining Table', 'Color': 'Grey'},
    ),
    ProductVariationModel(
      id: '6',
      stock: 4,
      price: 2500,
      salePrice: 2200,
      image: TImages.product37DiningTable,
      attributeValues: {'Type': 'Dining Table', 'Color': 'Brown'},
    ),
    ProductVariationModel(
      id: '7',
      stock: 3,
      price: 2500,
      salePrice: 2200,
      image: TImages.product38Refrigerator,
      attributeValues: {'Type': 'Refrigerator', 'Color': 'White'},
    ),
    ProductVariationModel(
      id: '8',
      stock: 3,
      price: 2500,
      salePrice: 2200,
      image: TImages.product38Refrigerator,
      attributeValues: {'Type': 'Refrigerator', 'Color': 'Grey'},
    ),
    ProductVariationModel(
      id: '9',
      stock: 4,
      price: 2500,
      salePrice: 2200,
      image: TImages.product38Refrigerator,
      attributeValues: {'Type': 'Refrigerator', 'Color': 'Brown'},
    ),
   ],
  productType: 'ProductType.variable',
),

// Office Furniture
ProductModel(
  id: '020',
  title: 'Professional Office Chair Collection',
  stock: 25,
  price: 450,
  isFeatured: true,
  thumbnail: TImages.productImage39,
  description: 'Ergonomic office chairs designed for maximum comfort during long work hours.',
  brand: BrandModel(
    id: '4',
    image: TImages.hermanMillerLogo,
    name: 'Herman',
    productCount: 111,
    isFeatured: false,
  ),
  images: [
    TImages.productImage39,
    TImages.productImage40,
  ],
  salePrice: 399,
  sku: 'OFC4578',
  categoryId: '13', // Office Furniture
  productAttributes: [
    ProductAttributeModel(name: 'Type', values: ['Executive', 'Task Chair']),
    ProductAttributeModel(name: 'Color', values: ['Black', 'Grey']),
  ],
  productVariations: [
      ProductVariationModel(
      id: '1',
      stock: 6,
      price: 450,
      salePrice: 399,
      image: TImages.product39OfficeChair,
      attributeValues: {'Type': 'Executive', 'Color': 'Black'},
    ),
    ProductVariationModel(
      id: '2',
      stock: 6,
      price: 450,
      salePrice: 399,
      image: TImages.product39OfficeChair,
      attributeValues: {'Type': 'Executive', 'Color': 'Grey'},
    ),
    ProductVariationModel(
      id: '3',
      stock: 6,
      price: 400,
      salePrice: 399,
      image: TImages.product40OfficeChair,
      attributeValues: {'Type': 'Task Chair', 'Color': 'Black'},
    ),
    ProductVariationModel(
      id: '4',
      stock: 7,
      price: 400,
      salePrice: 399,
      image: TImages.product40OfficeChair,
      attributeValues: {'Type': 'Task Chair', 'Color': 'Grey'},
    ),
  ],
  productType: 'ProductType.variable',
),

// Slippers Collection
ProductModel(
  id: '021',
  title: 'Comfort Slippers Collection',
  stock: 50,
  price: 29.99,
  isFeatured: false,
  thumbnail: TImages.productImage74,
  description: 'Comfortable home slippers available in various designs and sizes.',
  brand: BrandModel(
    id: '9',
    image: TImages.pumaLogo,
    name: 'Puma',
    productCount: 564,
    isFeatured: false,
  ),
  images: [
    TImages.productImage74,
    TImages.productImage75,
    TImages.productImage76,
    TImages.productImage77,
  ],
  salePrice: 24.99,
  sku: 'SLP4579',
  categoryId: '8', // Footwear
  productAttributes: [
    ProductAttributeModel(name: 'Size', values: ['UK 6', 'UK 7', 'UK 8', 'UK 9']),
    ProductAttributeModel(name: 'Color', values: ['Brown', 'Black', 'Grey']),
  ],
  productVariations: [
 
    ProductVariationModel(
      id: '1',
      stock: 4,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product74Slipper,
      attributeValues: {'Size': 'UK 6', 'Color': 'Brown'},
    ),
    ProductVariationModel(
      id: '2',
      stock: 4,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product74Slipper,
      attributeValues: {'Size': 'UK 6', 'Color': 'Black'},
    ),
    ProductVariationModel(
      id: '3',
      stock: 4,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product74Slipper,
      attributeValues: {'Size': 'UK 6', 'Color': 'Grey'},
    ),
    ProductVariationModel(
      id: '4',
      stock: 4,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product75Slipper,
      attributeValues: {'Size': 'UK 7', 'Color': 'Brown'},
    ),
    ProductVariationModel(
      id: '5',
      stock: 4,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product75Slipper,
      attributeValues: {'Size': 'UK 7', 'Color': 'Black'},
    ),
    ProductVariationModel(
      id: '6',
      stock: 4,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product75Slipper,
      attributeValues: {'Size': 'UK 7', 'Color': 'Grey'},
    ),
    ProductVariationModel(
      id: '7',
      stock: 4,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product76Slipper,
      attributeValues: {'Size': 'UK 8', 'Color': 'Brown'},
    ),
    ProductVariationModel(
      id: '8',
      stock: 4,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product76Slipper,
      attributeValues: {'Size': 'UK 8', 'Color': 'Black'},
    ),
    ProductVariationModel(
      id: '9',
      stock: 4,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product76Slipper,
      attributeValues: {'Size': 'UK 8', 'Color': 'Grey'},
    ),
    ProductVariationModel(
      id: '10',
      stock: 5,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product77Slipper,
      attributeValues: {'Size': 'UK 9', 'Color': 'Brown'},
    ),
    ProductVariationModel(
      id: '11',
      stock: 5,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product77Slipper,
      attributeValues: {'Size': 'UK 9', 'Color': 'Black'},
    ),
    ProductVariationModel(
      id: '12',
      stock: 5,
      price: 29.99,
      salePrice: 24.99,
      image: TImages.product77Slipper,
      attributeValues: {'Size': 'UK 9', 'Color': 'Grey'},
    ),
  ],
  productType: 'ProductType.variable',
),
];




static List<BrandModel> brands=[
 BrandModel(id: '1', name: 'Nike', image: TImages.nikeLogo, isFeatured: true, productCount: 289),
 BrandModel(id: '2', name: 'Adidas', image: TImages.adidasLogo, isFeatured: true, productCount: 345),
 BrandModel(id: '3', name: 'Apple', image: TImages.appleLogo, isFeatured: true, productCount: 344),
 BrandModel(id: '4', name: 'Herman', image: TImages.hermanMillerLogo, isFeatured: false, productCount: 111),
 BrandModel(id: '5', name: 'Ikea', image: TImages.ikeaLogo, isFeatured: false, productCount: 450),
 BrandModel(id: '6', name: 'Jordan', image:TImages.jordanLogo, isFeatured: false, productCount: 239),
 BrandModel(id: '7', name: 'Samsung', image: TImages.appleLogo, isFeatured: true, productCount: 189),
 BrandModel(id: '8', name: 'Kenwood', image: TImages.kenwoodLogo, isFeatured: false, productCount: 369),
 BrandModel(id: '9', name: 'Puma', image: TImages.pumaLogo, isFeatured: false, productCount: 564),
 BrandModel(id: '10', name: 'Acer', image: TImages.acerlogo, isFeatured: false, productCount: 785),
];


static List<BrandCategoryModel> BrandCategory = [
  // Sports (Category ID: "1")
  BrandCategoryModel(brandId: "1", categoryId: "1"), // Nike -> Sports
  BrandCategoryModel(brandId: "2", categoryId: "1"), // Adidas -> Sports
  BrandCategoryModel(brandId: "6", categoryId: "1"), // Jordan -> Sports
  BrandCategoryModel(brandId: "9", categoryId: "1"), // Puma -> Sports

  // Furniture (Category ID: "5")
  BrandCategoryModel(brandId: "4", categoryId: "5"), // Herman -> Furniture
  BrandCategoryModel(brandId: "5", categoryId: "5"), // Ikea -> Furniture

  // Electronics (Category ID: "2")
  BrandCategoryModel(brandId: "3", categoryId: "2"), // Apple -> Electronics
  BrandCategoryModel(brandId: "7", categoryId: "2"), // Samsung -> Electronics
  BrandCategoryModel(brandId: "8", categoryId: "2"), // Kenwood -> Electronics

  // Clothes (Category ID: "3")
  BrandCategoryModel(brandId: "1", categoryId: "3"), // Nike -> Clothes
  BrandCategoryModel(brandId: "2", categoryId: "3"), // Adidas -> Clothes
  BrandCategoryModel(brandId: "6", categoryId: "3"), // Jordan -> Clothes

  // Animals (Category ID: "4")
  BrandCategoryModel(brandId: "1", categoryId: "4"), // Nike -> Animals
  BrandCategoryModel(brandId: "2", categoryId: "4"), // Adidas -> Animals
  BrandCategoryModel(brandId: "6", categoryId: "4"), // Jordan -> Animals

  // Shoes (Category ID: "6")
  BrandCategoryModel(brandId: "1", categoryId: "6"), // Nike -> Shoes
  BrandCategoryModel(brandId: "2", categoryId: "6"), // Adidas -> Shoes
  BrandCategoryModel(brandId: "6", categoryId: "6"), // Jordan -> Shoes
  BrandCategoryModel(brandId: "9", categoryId: "6"), // Puma -> Shoes

  // Cosmetics (Category ID: "7")
  BrandCategoryModel(brandId: "1", categoryId: "7"), // Nike -> Cosmetics
  BrandCategoryModel(brandId: "2", categoryId: "7"), // Adidas -> Cosmetics
  BrandCategoryModel(brandId: "6", categoryId: "7"), // Jordan -> Cosmetics

  // Jewelry (Category ID: "14")
  BrandCategoryModel(brandId: "1", categoryId: "14"), // Nike -> Jewelry
  BrandCategoryModel(brandId: "2", categoryId: "14"), // Adidas -> Jewelry
  BrandCategoryModel(brandId: "6", categoryId: "14"), // Jordan -> Jewelry

  // Subcategories

  // Sport Shoes (Subcategory ID: "8")
  BrandCategoryModel(brandId: "1", categoryId: "8"), // Nike -> Sport Shoes
  BrandCategoryModel(brandId: "2", categoryId: "8"), // Adidas -> Sport Shoes
  BrandCategoryModel(brandId: "6", categoryId: "8"), // Jordan -> Sport Shoes
  BrandCategoryModel(brandId: "9", categoryId: "8"), // Puma -> Sport Shoes

  // Track Suits (Subcategory ID: "9")
  BrandCategoryModel(brandId: "1", categoryId: "9"), // Nike -> Track Suits
  BrandCategoryModel(brandId: "2", categoryId: "9"), // Adidas -> Track Suits
  BrandCategoryModel(brandId: "6", categoryId: "9"), // Jordan -> Track Suits
  BrandCategoryModel(brandId: "9", categoryId: "9"), // Puma -> Track Suits

  // Sports Equipments (Subcategory ID: "10")
  BrandCategoryModel(brandId: "1", categoryId: "10"), // Nike -> Sports Equipments
  BrandCategoryModel(brandId: "2", categoryId: "10"), // Adidas -> Sports Equipments
  BrandCategoryModel(brandId: "6", categoryId: "10"), // Jordan -> Sports Equipments
  BrandCategoryModel(brandId: "9", categoryId: "10"), // Puma -> Sports Equipments

  // Bedroom Furniture (Subcategory ID: "11")
  BrandCategoryModel(brandId: "4", categoryId: "11"), // Herman -> Bedroom Furniture
  BrandCategoryModel(brandId: "5", categoryId: "11"), // Ikea -> Bedroom Furniture

  // Kitchen Furniture (Subcategory ID: "12")
  BrandCategoryModel(brandId: "4", categoryId: "12"), // Herman -> Kitchen Furniture
  BrandCategoryModel(brandId: "5", categoryId: "12"), // Ikea -> Kitchen Furniture

  // Office Furniture (Subcategory ID: "13")
  BrandCategoryModel(brandId: "4", categoryId: "13"), // Herman -> Office Furniture
  BrandCategoryModel(brandId: "5", categoryId: "13"), // Ikea -> Office Furniture

  // Laptop (Subcategory ID: "14")
  BrandCategoryModel(brandId: "3", categoryId: "14"), // Apple -> Laptop
  BrandCategoryModel(brandId: "7", categoryId: "14"), // Samsung -> Laptop
  BrandCategoryModel(brandId: "8", categoryId: "14"), // Kenwood -> Laptop

  // Mobile (Subcategory ID: "15")
  BrandCategoryModel(brandId: "3", categoryId: "15"), // Apple -> Mobile
  BrandCategoryModel(brandId: "7", categoryId: "15"), // Samsung -> Mobile
  BrandCategoryModel(brandId: "8", categoryId: "15"), // Kenwood -> Mobile

  // Shirts (Subcategory ID: "16")
  BrandCategoryModel(brandId: "1", categoryId: "16"), // Nike -> Shirts
  BrandCategoryModel(brandId: "2", categoryId: "16"), // Adidas -> Shirts
  BrandCategoryModel(brandId: "6", categoryId: "16"), // Jordan -> Shirts
];


 
static final List<ProductCategory> productCategory = [
  // Main categories
  ProductCategory(categoryId: '1', productId: '001'), // Green Nike sports shoe -> Sports
  ProductCategory(categoryId: '16', productId: '002'), // Blue T-shirt for all ages -> Shirts (Clothes)
  ProductCategory(categoryId: '16', productId: '003'), // Leather brown Jacket -> Shirts (Clothes)
  ProductCategory(categoryId: '16', productId: '004'), // 4 Color collar t-shirt dry fit -> Shirts (Clothes)
  ProductCategory(categoryId: '8', productId: '005'), // Nike Air Jordan Shoes -> Sport Shoes (Sports)
  ProductCategory(categoryId: '2', productId: '006'), // SAMSUNG Galaxy S9 -> Electronics
  ProductCategory(categoryId: '4', productId: '007'), // TOMI Dog food -> Animals
  ProductCategory(categoryId: '8', productId: '009'), // Nike Air Jordon 19 Blue -> Sport Shoes (Sports)

  // Subcategories
  ProductCategory(categoryId: '8', productId: '001'), // Green Nike sports shoe -> Sport Shoes (Sports)
  ProductCategory(categoryId: '9', productId: '001'), // Green Nike sports shoe -> Track suits (Sports)
  ProductCategory(categoryId: '10', productId: '001'), // Green Nike sports shoe -> Sports Equipments (Sports)

  // Furniture subcategories
  ProductCategory(categoryId: '11', productId: '002'), // Blue T-shirt for all ages -> Bedroom furniture (Furniture)
  ProductCategory(categoryId: '12', productId: '002'), // Blue T-shirt for all ages -> Kitchen furniture (Furniture)
  ProductCategory(categoryId: '13', productId: '002'), // Blue T-shirt for all ages -> Office furniture (Furniture)

  // Electronics subcategories
  ProductCategory(categoryId: '14', productId: '006'), // SAMSUNG Galaxy S9 -> Laptop (Electronics)
  ProductCategory(categoryId: '15', productId: '006'), // SAMSUNG Galaxy S9 -> Mobile (Electronics)

  // Clothes subcategory
  ProductCategory(categoryId: '16', productId: '004'), // 4 Color collar t-shirt dry fit -> Shirts (Clothes)
];




}