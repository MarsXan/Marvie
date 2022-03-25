import 'package:flutter/material.dart';
import 'package:marvie/core/components/navigation/custom_bottom_navigation.dart';
import 'package:marvie/core/components/navigation/nav_item.dart';
import 'package:marvie/core/screens/screen_with_menu.screen.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/presentation/menu/menu_type.dart';
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
    length: 5,
    vsync: this,
    initialIndex: 2,
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: _controller,
            children: const [
              StoreFavoriteList(),
              StoreScreen(),
              StoreScreen2(),
              StoreScreen(),
              StoreScreen2(),
            ],
          ),
          CustomBottomNavigation(
            tabController: _controller,
            itemList: [
              NavItem(
                  title: "Favorite",
                  icon: 'asset/icons/NavigationHeartOff.svg'),
              NavItem(
                  title: "Message",
                  icon: 'asset/icons/NavigationMessageOff.svg'),
              NavItem(title: "Home", icon: 'asset/icons/NationHomeOff.svg'),
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
