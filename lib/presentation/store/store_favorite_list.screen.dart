import 'package:flutter/material.dart';
import 'package:marvie/core/models/product/product.dart';

import 'store_vert.card.dart';

class StoreFavoriteList extends StatefulWidget {
  const StoreFavoriteList({Key? key}) : super(key: key);

  @override
  State<StoreFavoriteList> createState() => _StoreFavoriteListState();
}

class _StoreFavoriteListState extends State<StoreFavoriteList> {
  var list = Product.productList(areFavoriteProducts: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  runSpacing: 10,
                  spacing: 15,
                  alignment: WrapAlignment.center,
                  children: List.generate(list.length, (index) {
                    return StoreVertCard(
                      product: list[index],
                      onLikeTap: (product) {
                        setState(() {
                          var p = list.firstWhere(
                              (element) => element.id == product.id);

                          p.isFavorite = !p.isFavorite;
                        });
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
