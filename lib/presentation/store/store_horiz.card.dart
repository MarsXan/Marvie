import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/models/product.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

class StoreHorizCard extends StatelessWidget {
  const StoreHorizCard(
      {Key? key, required this.product, required this.onLikeTap})
      : super(key: key);
  final Product product;
  final Function(Product) onLikeTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      height: 210,
      width: (MediaQuery.of(context).size.width - 45),
      decoration: BoxDecoration(
          color: darkGreen50,
          borderRadius: BorderRadius.circular(cardBorderRadius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  product.title,
                  style: darkGreenInputStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "\$${product.price}",
                  style: largeTitleStyle.copyWith(color: darkGreen400),
                ),
                const SizedBox(
                  height: 39,
                ),
                GestureDetector(
                  onTap: () {
                    onLikeTap(product);
                  },
                  child: Container(
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 39),
            child: Image(
              image: AssetImage(product.image),
            ),
          ),
        ],
      ),
    );
  }
}
