import 'package:marvie/core/models/product/product_size.dart';
import 'package:marvie/core/models/product/product_type.dart';

class Product {
  int id;
  String title;
  String image;
  int price;
  bool isFavorite;
  ProductType type;
  ProductSize productSize;
  int count;

  Product(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.isFavorite,
      this.type = ProductType.medium,
      this.productSize = ProductSize.m,
      this.count = 1});

  static List<Product> productList(
      {bool isFirstItemLarge = false, bool areFavoriteProducts = false}) {
    return [
      Product(
          id: 0,
          title: "Belt suit blazer",
          image: isFirstItemLarge
              ? 'asset/images/product5_image.png'
              : 'asset/images/product1_image.png',
          price: 120,
          isFavorite: areFavoriteProducts,
          type: isFirstItemLarge ? ProductType.large : ProductType.medium),
      Product(
          id: 1,
          title: "Belt suit blazer",
          image: 'asset/images/product2_image.png',
          price: 200,
          isFavorite: areFavoriteProducts),
      Product(
          id: 2,
          title: "Belt suit blazer",
          image: 'asset/images/product3_image.png',
          price: 110,
          isFavorite: areFavoriteProducts),
      Product(
          id: 3,
          title: "Belt suit blazer",
          image: 'asset/images/product4_image.png',
          price: 170,
          isFavorite: areFavoriteProducts),
      Product(
          id: 4,
          title: "Belt suit blazer",
          image: 'asset/images/product1_image.png',
          price: 120,
          isFavorite: areFavoriteProducts),
      Product(
          id: 5,
          title: "Belt suit blazer",
          image: 'asset/images/product2_image.png',
          price: 200,
          isFavorite: areFavoriteProducts),
      Product(
          id: 6,
          title: "Belt suit blazer",
          image: 'asset/images/product3_image.png',
          price: 110,
          isFavorite: areFavoriteProducts),
      Product(
          id: 7,
          title: "Belt suit blazer",
          image: 'asset/images/product4_image.png',
          price: 170,
          isFavorite: areFavoriteProducts),
    ];
  }
}
