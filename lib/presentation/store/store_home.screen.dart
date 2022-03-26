import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvie/core/components/navigation/custom_bottom_navigation.dart';
import 'package:marvie/core/components/navigation/nav_item.dart';
import 'package:marvie/core/screens/screen_with_menu.screen.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/text_styles.dart';
import 'package:marvie/presentation/menu/menu_type.dart';
import 'package:marvie/presentation/store/cart.screen.dart';
import 'package:marvie/presentation/store/store2.screen.dart';
import 'package:marvie/presentation/store/store_favorite_list.screen.dart';

import 'store.screen.dart';

class StoreHome extends StatefulWidget {
  const StoreHome({Key? key}) : super(key: key);

  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> with TickerProviderStateMixin {
  late final TabController _controller = TabController(
    length: 3,
    vsync: this,
    initialIndex: 1,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWithMenu(
      gradient: darkOrangeGradient,
      selectedMenu: MenuType.shop,
      rightMenuItem: Badge(
        position: BadgePosition.topEnd(top: 0, end: 3),
        badgeContent: const Text(
          '2',
          style: whiteCaptionStyle,
        ),
        child: IconButton(
            onPressed: () {
              Get.to(() => const CartScreen());
            },
            icon: Icon(
              Platform.isAndroid
                  ? Icons.shopping_cart_outlined
                  : CupertinoIcons.shopping_cart,
              color: Colors.white,
            )),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: _controller,
            children: const [
              StoreFavoriteList(),
              StoreScreen2(),
              StoreScreen(),
            ],
          ),
          CustomBottomNavigation(
            tabController: _controller,
            itemList: [
              NavItem(
                  title: "Favorite",
                  icon: 'asset/icons/NavigationHeartOff.svg'),
              NavItem(title: "Home", icon: 'asset/icons/NationHomeOff.svg'),
              NavItem(
                  title: "Favorite", icon: 'asset/icons/NavigationStarOff.svg'),
            ],
          )
        ],
      ),
    );
  }
}
