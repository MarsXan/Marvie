import 'package:marvie/core/models/product_type.dart';

class Product {
  String title;
  String image;
  int price;
  bool isFavorite;
  ProductType type;

  Product(
      {required this.title,
      required this.image,
      required this.price,
      required this.isFavorite,
      this.type = ProductType.medium});

  static List<Product> productList({bool isFirstItemLarge = false}) {
    return [
      Product(
          title: "Belt suit blazer",
          image: isFirstItemLarge
              ? 'asset/images/product5_image.png'
              : 'asset/images/product1_image.png',
          price: 120,
          isFavorite: false,
          type: isFirstItemLarge ? ProductType.large : ProductType.medium),
      Product(
          title: "Belt suit blazer",
          image: 'asset/images/product2_image.png',
          price: 200,
          isFavorite: false),
      Product(
          title: "Belt suit blazer",
          image: 'asset/images/product3_image.png',
          price: 110,
          isFavorite: false),
      Product(
          title: "Belt suit blazer",
          image: 'asset/images/product4_image.png',
          price: 170,
          isFavorite: false),
      Product(
          title: "Belt suit blazer",
          image: 'asset/images/product1_image.png',
          price: 120,
          isFavorite: false),
      Product(
          title: "Belt suit blazer",
          image: 'asset/images/product2_image.png',
          price: 200,
          isFavorite: false),
      Product(
          title: "Belt suit blazer",
          image: 'asset/images/product3_image.png',
          price: 110,
          isFavorite: false),
      Product(
          title: "Belt suit blazer",
          image: 'asset/images/product4_image.png',
          price: 170,
          isFavorite: false),
    ];
  }
}
