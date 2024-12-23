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


static final List<ProductModel> products = [
  ProductModel(
    id: '001',
    title: 'Green Nike sports shoe',
    stock: 15,
    price: 135.0,
    isFeatured: true,
    thumbnail: TImages.productImage1,
    description: 'Green Nike sports shoe',
    brand: BrandModel(
      id: '1',
      image: TImages.nikeLogo,
      name: 'Nike',
      productCount: 265,
      isFeatured: true,
    ),
    images: [
      TImages.productImage1,
      TImages.productImage25,
      TImages.productImage21,
      TImages.productImage9,
    ],
    salePrice: 30.0,
    sku: 'ABR4568',
    categoryId: '1',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
      ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
    ],
    productVariations: [
      ProductVariationModel(
        id: '1',
        stock: 34,
        price: 134.0,
        salePrice: 122.6,
        image: TImages.productImage1,
        description: 'This is a product description for Green Nike sports shoe.',
        attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '2',
        stock: 15,
        price: 152.0,
        image: TImages.productImage23,
        attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '3',
        stock: 0,
        price: 234.0,
        image: TImages.productImage23,
        attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '4',
        stock: 222,
        price: 252.0,
        image: TImages.productImage1,
        attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '5',
        stock: 0,
        price: 334.0,
        image: TImages.productImage21,
        attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '6',
        stock: 11,
        price: 332.0,
        image: TImages.productImage21,
        attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
      ),
    ], productType: 'ProductType.variable',
  ),


 ProductModel(
    id: '002',
    title: 'Blue T-shirt for all ages',
    stock: 15,
    price: 35.0,
    isFeatured: true,
    thumbnail: TImages.productImage69,
    description: 'This is a Product description for Blue Nike Sleeveless vest. There are more things that can be added but I am just practicing and nothing else.',
    brand: BrandModel(
      id: '5',
      image: TImages.zaraLogo,
      name: 'ZARA',
    ),
    images: [
      TImages.productImage68,
      TImages.productImage69,
      TImages.productImage5,
    ],
    salePrice: 30.0,
    sku: 'ABR4568',
    categoryId: '16',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: 'ProductType.single',
  ),
  ProductModel(
    id: '003',
    title: 'Leather brown Jacket',
    stock: 15,
    price: 38000,
    isFeatured: false,
    thumbnail: TImages.productImage64,
    description: 'This is a Product description for Leather brown Jacket. There are more things that can be added but I am just practicing and nothing else.',
    brand: BrandModel(
      id: '6',
      image: TImages.zaraLogo,
      name: 'ZARA',
    ),
    images: [
      TImages.productImage64,
      TImages.productImage65,
      TImages.productImage66,
      TImages.productImage67,
    ],
    salePrice: 30.0,
    sku: 'ABR4568',
    categoryId: '16',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: 'ProductType.single',
  ),
  ProductModel(
    id: '004',
    title: '4 Color collar t-shirt dry fit',
    stock: 15,
    price: 135,
    isFeatured: false,
    thumbnail: TImages.productImage60,
    description: 'This is a product description for 4 color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else',
    brand: BrandModel(
      id: '6',
      image: TImages.zaraLogo,
      name: 'ZARA',
    ),
    images: [TImages.productImage60,TImages.productImage61,TImages.productImage62,TImages.productImage63 ],
    salePrice: 30,
    sku: 'ABR4568',
    categoryId: '16',
    productAttributes: [ 
      ProductAttributeModel(name : 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
      ProductAttributeModel(name : 'Size', values: ['EU 30', 'EU 32 ', 'EU 34'])
     ],
    productVariations: [
      ProductVariationModel(
        id: '1', 
        stock: 34,
        price: 134,
        salePrice: 122.6,
        image: TImages.productImage60,
        description: 'This is a product description for 4 Color collar t-shirt dry fit',
        attributeValues: { 'Colors':'Red', 'Size':'EU 34'}),

        ProductVariationModel(id: '2', stock: 15, price: 132,image: TImages.productImage60,attributeValues: {'Color':'Red' ,'Size':'EU 32'}),
        ProductVariationModel(id: '3', stock: 0, price: 132,image: TImages.productImage61,attributeValues: {'Color':'Yellow' ,'Size':'EU 34'}),
        ProductVariationModel(id: '4', stock: 12, price: 100,image: TImages.productImage62,attributeValues: {'Color':'Yellow' ,'Size':'EU 34'}),
        ProductVariationModel( id: '5',stock: 0, price: 334,image: TImages.productImage63,attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
), // ProductVariationModel

ProductVariationModel(
  id: '6',
  stock: 11,
  price: 332,
  image: TImages.productImage64,
  attributeValues: {'Color': 'Green', 'Size': 'EU 30'},
), // ProductVariationModel

ProductVariationModel(
  id: '7',
  stock: 8,
  price: 334,
  image: TImages.productImage65,
  attributeValues: {'Color': 'Blue', 'Size': 'EU 30'},
), // ProductVariationModel

ProductVariationModel(
  id: '8',
  stock: 11,
  price: 332,
  image: TImages.productImage66,
  attributeValues: {'Color': 'Blue', 'Size': 'EU 34'},
), // ProductVariationModel 
    ],
    productType: 'ProductType.variable',
  ),
 

   ProductModel(
    id: '005',
    title: 'Nike Air Jordan Shoes',
    stock: 15,
    price: 35,
    isFeatured: false,
    thumbnail: TImages.productImage10,
    description: 'This is a product description for 4 color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else',
    brand: BrandModel(
      id: '1',
      image: TImages.nikeLogo,
      name: 'Nike',
      productCount: 256,
      isFeatured: true
    ),
    images: [TImages.productImage7,TImages.productImage8,TImages.productImage9,TImages.productImage10 ],
    salePrice: 30,
    sku: 'ABR4568',
    categoryId: '8',
    productAttributes: [ 
      ProductAttributeModel(name : 'Color', values: ['Orange', 'Black', 'Brown']),
      ProductAttributeModel(name : 'Size', values: ['EU 30', 'EU 32 ', 'EU 34'])
     ],
    productVariations: [
      ProductVariationModel(
        id: '1', 
        stock: 16,
        price: 36,
        salePrice: 12.6,
        image: TImages.productImage8,
        description: 'This is a product description for 4 Color collar t-shirt dry fit',
        attributeValues: { 'Colors':'Red', 'Size':'EU 34'}),

        ProductVariationModel(id: '2', stock: 15, price: 35,image: TImages.productImage7,attributeValues: {'Color':'Black' ,'Size':'EU 32'}),
        ProductVariationModel(id: '3', stock: 15, price: 34,image: TImages.productImage9,attributeValues: {'Color':'Brown' ,'Size':'EU 34'}),
        ProductVariationModel(id: '4', stock: 13, price: 33,image: TImages.productImage7,attributeValues: {'Color':'Black' ,'Size':'EU 34'}),
        ProductVariationModel( id: '5',stock:12, price: 32,image: TImages.productImage9,attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
        ProductVariationModel( id: '6',stock:11, price: 32,image: TImages.productImage8,attributeValues: {'Color': 'Brown', 'Size': 'EU 32'},), // ProductVariationModel
   ],
    productType: 'ProductType.variable',
  ),
     
     ProductModel(
  id: '006',
  title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM)',
  stock: 15,
  price: 750,
  isFeatured: false,
  thumbnail: TImages.productImage11,
  description: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
  brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Samsung'),
  images: [
    TImages.productImage11,
    TImages.productImage12,
    TImages.productImage13,
    TImages.productImage12,
  ],
  salePrice: 650,
  sku: 'ABR4568',
  categoryId: '2',
  productAttributes: [
    ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
    ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
  ],
  productType: 'ProductType.single',
),

ProductModel(
  id: '007',
  title: 'TOMI Dog food',
  stock: 25,
  price: 20,
  isFeatured: false,
  thumbnail: TImages.productImage18,
  description: 'This is a Product description for TOMI Dog food. There are more things that can be added but I am just practicing and nothing else.',
  brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Tomi'),
  salePrice: 10,
  sku: 'ABR4568',
  categoryId: '4',
  productAttributes: [
    ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
    ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
  ],
  productType: 'ProductType.single',
),

ProductModel(
  id: '009',
  title: 'Nike Air Jordon 19 Blue',
  stock: 15,
  price: 400,
  isFeatured: false,
  thumbnail: TImages.productImage19,
  description:
      'This is a Product description for Nike Air Jordon. There are more things that can be added but I am just practicing and nothing else.',
  brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
  images: [
    TImages.productImage19,
    TImages.productImage20,
    TImages.productImage21,
    TImages.productImage22
  ],
  salePrice: 200,
  sku: 'ABR4568',
  categoryId: '8',
  productAttributes: [
    ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
    ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
  ],
  productType: 'ProductType.single',
)


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