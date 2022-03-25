import 'package:flutter/material.dart';
import 'package:marvie/core/components/categories/category.model.dart';
import 'package:marvie/core/components/categories/category_card.widget.dart';
import 'package:marvie/core/components/navigation/custom_bottom_navigation.dart';
import 'package:marvie/core/components/navigation/nav_item.dart';
import 'package:marvie/core/models/product/product.dart';
import 'package:marvie/core/screens/screen_with_menu.screen.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/presentation/menu/menu_type.dart';

import 'store_vert.card.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  CategoryItem selectedItem = categoryList[0];
  var list = Product.productList();

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
                return <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 55.0,
                    pinned: false,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: Container(
                      height: 52,
                      padding: const EdgeInsets.only(left: 15),
                      child: ListView.builder(
                        itemCount: categoryList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            item: categoryList[index],
                            onPress: (catItem) {
                              setState(() {
                                selectedItem = catItem;
                              });
                            },
                            backgroundColor: selectedItem == categoryList[index]
                                ? green300
                                : darkGreen50d,
                            width: index == 0 ? 52 : null,
                            padding: index == 0 ? 12 : 24,
                          );
                        },
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
