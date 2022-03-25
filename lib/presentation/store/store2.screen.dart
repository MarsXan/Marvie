import 'package:flutter/material.dart';
import 'package:marvie/core/components/categories/category.model.dart';
import 'package:marvie/core/components/categories/category_vert.card.dart';
import 'package:marvie/core/components/navigation/custom_bottom_navigation.dart';
import 'package:marvie/core/components/navigation/nav_item.dart';
import 'package:marvie/core/models/product/product.dart';
import 'package:marvie/core/models/product/product_type.dart';
import 'package:marvie/core/screens/screen_with_menu.screen.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/presentation/menu/menu_type.dart';
import 'package:marvie/presentation/store/store_horiz.card.dart';

import 'store_vert.card.dart';

class StoreScreen2 extends StatefulWidget {
  const StoreScreen2({Key? key}) : super(key: key);

  @override
  State<StoreScreen2> createState() => _StoreScreen2State();
}

class _StoreScreen2State extends State<StoreScreen2> {
  CategoryItem selectedItem = categoryList[0];
  var list = Product.productList(isFirstItemLarge: true);

  @override
  Widget build(BuildContext context) {
    return ScreenWithMenu(
      selectedMenu: MenuType.shop,
      gradient: darkOrangeGradient,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 155.0,
                    pinned: false,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: SingleChildScrollView(
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.only(left: 15),
                        child: ListView.builder(
                          itemCount: categoryList2.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryVertCard(
                              item: categoryList2[index],
                              onPress: (catItem) {
                                setState(() {
                                  selectedItem = catItem;
                                });
                              },
                              backgroundColor:
                                  selectedItem == categoryList2[index]
                                      ? red400d
                                      : darkGreen50d,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Wrap(
                          runSpacing: 19,
                          spacing: 15,
                          alignment: WrapAlignment.center,
                          children: List.generate(list.length, (index) {
                            var p = list[index];
                            return p.type == ProductType.large
                                ? StoreHorizCard(
                                    product: p,
                                    onLikeTap: (product) {
                                      setState(() {
                                        var p = list.firstWhere((element) =>
                                            element.id == product.id);

                                        p.isFavorite = !p.isFavorite;
                                      });
                                    },
                                  )
                                : StoreVertCard(
                                    product: p,
                                    onLikeTap: (product) {
                                      setState(() {
                                        var p = list.firstWhere((element) =>
                                            element.id == product.id);

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
            ),
          ),
          CustomBottomNavigation(
            itemList: [
              NavItem(
                  title: "Favorite",
                  icon: 'asset/icons/NavigationHeartOff.svg'),
              NavItem(title: "Home", icon: 'asset/icons/NationHomeOff.svg'),
              NavItem(
                  title: "Message",
                  icon: 'asset/icons/NavigationMessageOff.svg'),
              NavItem(
                  title: "Notifications",
                  icon: 'asset/icons/NavigationBellOff.svg'),
              NavItem(
                  title: "Favorite", icon: 'asset/icons/NavigationStarOff.svg'),
            ],
            onItemChange: (int index) {},
          )
        ],
      ),
    );
  }
}
