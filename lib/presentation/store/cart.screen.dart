import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/components/buttons/custom_button.widget.dart';
import 'package:marvie/core/models/product/product.dart';
import 'package:marvie/core/screens/screen_with_menu.screen.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';
import 'package:marvie/presentation/menu/menu_type.dart';
import 'package:marvie/presentation/store/cart.card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWithMenu(
      selectedMenu: MenuType.shop,
      gradient: darkOrangeGradient,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
            child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    const SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: false,
                        backgroundColor: Colors.transparent,
                        flexibleSpace: Text(
                          "Cart",
                          style: extraLargeTitleStyle,
                        ))
                  ];
                },
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: getListItems(),
                )),
          ),
          Container(
            height: 126,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
                color: darkGreen50d,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(cardBorderRadius),
                    topLeft: Radius.circular(cardBorderRadius))),
            child: Padding(
              padding: const EdgeInsets.only(top: 24, left: 30, right: 30),
              child: CustomButton(
                title: 'Proceed to Checkout',
                backGroundColor: green300d,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getListItems() {
    List<Product> pList = [
      Product(
        id: 0,
        isFavorite: false,
        title: "The North face 100 glacier 1/4 zip",
        image: 'asset/images/product6_image.png',
        price: 90,
      ),
      Product(
        id: 0,
        isFavorite: false,
        title: "The North face 100 glacier 1/4 zip",
        image: 'asset/images/product7_image.png',
        price: 120,
      )
    ];
    List<Widget> list = [];
    var totalPrice = 0;

    for (Product p in pList) {
      list.add(CartCard(
        product: p,
      ));
      totalPrice += p.price;
    }

    var totalWidget = Row(children: [
      Container(
        margin: const EdgeInsets.only(left: 30.0),
        width: 69,
        height: 69,
        decoration: BoxDecoration(
            color: green300d, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('asset/icons/delivery_icon.svg'),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "FREE",
              style: whiteCaptionStyle,
            )
          ],
        ),
      ),
      const SizedBox(
        width: 36,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total:",
            style: darkGreenInputStyle,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "\$$totalPrice",
            style: whiteNormalMediumHeadingStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width - (168),
              child: const Divider(
                color: Colors.white,
                thickness: 0.1,
              ))
        ],
      )
    ]);

    list.add(totalWidget);
    return list;
  }
}
