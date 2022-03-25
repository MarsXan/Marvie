import 'package:flutter/material.dart';
import 'package:marvie/core/models/product/product.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(cardBorderRadius),
            child: Container(
              height: 125,
              width: 105,
              padding: const EdgeInsets.only(left: 0),
              decoration: const BoxDecoration(
                color: darkGreen50,
              ),
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage(product.image),
                fit: BoxFit.none,
              ),
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  product.title,
                  style: darkGreenInputStyle.copyWith(color: Colors.white),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "\$${product.price}",
                style: darkGreenInputStyle.copyWith(color: Colors.white),
                textAlign: TextAlign.left,
              )
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: green300d),
                ),
                child: Text(
                  "${product.count}x",
                  style: greenCaptionStyle,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  product.productSize.toString().split('.').last.toUpperCase(),
                  style: whiteCaptionStyle,
                ),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: green300d),
              )
            ],
          )
        ],
      ),
    );
  }
}
