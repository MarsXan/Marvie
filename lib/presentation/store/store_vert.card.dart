import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/models/product/product.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

class StoreVertCard extends StatelessWidget {
  const StoreVertCard(
      {Key? key, required this.product, required this.onLikeTap})
      : super(key: key);
  final Product product;
  final Function(Product) onLikeTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomRight,
          height: 250,
          width: (MediaQuery.of(context).size.width - 45) / 2,
          decoration: BoxDecoration(
              color: darkGreen50,
              borderRadius: BorderRadius.circular(cardBorderRadius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  onLikeTap(product);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 16, bottom: 25),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 2),
                            blurRadius: 2)
                      ]),
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'asset/icons/NavigationHeartOff.svg',
                        fit: BoxFit.contain,
                        width: 12,
                        height: 12,
                        color: product.isFavorite ? red300 : null,
                      )),
                ),
              ),
              Image(
                image: AssetImage(product.image),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          product.title,
          style: darkGreenBodyStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "\$${product.price}",
          style: whiteBodyStyle,
        )
      ],
    );
  }
}
