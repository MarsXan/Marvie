import 'package:marvie/core/models/product_type.dart';

class Product {
  int id;
  String title;
  String image;
  int price;
  bool isFavorite;
  ProductType type;

  Product(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.isFavorite,
      this.type = ProductType.medium});

  static List<Product> productList({bool isFirstItemLarge = false}) {
    return [
      Product(
          id: 0,
          title: "Belt suit blazer",
          image: isFirstItemLarge
              ? 'asset/images/product5_image.png'
              : 'asset/images/product1_image.png',
          price: 120,
          isFavorite: false,
          type: isFirstItemLarge ? ProductType.large : ProductType.medium),
      Product(
          id: 1,
          title: "Belt suit blazer",
          image: 'asset/images/product2_image.png',
          price: 200,
          isFavorite: false),
      Product(
          id: 2,
          title: "Belt suit blazer",
          image: 'asset/images/product3_image.png',
          price: 110,
          isFavorite: false),
      Product(
          id: 3,
          title: "Belt suit blazer",
          image: 'asset/images/product4_image.png',
          price: 170,
          isFavorite: false),
      Product(
          id: 4,
          title: "Belt suit blazer",
          image: 'asset/images/product1_image.png',
          price: 120,
          isFavorite: false),
      Product(
          id: 5,
          title: "Belt suit blazer",
          image: 'asset/images/product2_image.png',
          price: 200,
          isFavorite: false),
      Product(
          id: 6,
          title: "Belt suit blazer",
          image: 'asset/images/product3_image.png',
          price: 110,
          isFavorite: false),
      Product(
          id: 7,
          title: "Belt suit blazer",
          image: 'asset/images/product4_image.png',
          price: 170,
          isFavorite: false),
    ];
  }
}
