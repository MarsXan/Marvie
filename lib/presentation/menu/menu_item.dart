import 'package:marvie/presentation/menu/menu_type.dart';

class MenuItem {
  String title;
  String icon;
  MenuType type;

  MenuItem({required this.title, required this.icon, required this.type});

  static List<MenuItem> getMenuList() {
    var _menuTitles = [
      "Shop",
      "Payment",
      "Chat",
      "Notifications",
      "Settings",
      "Rate Us"
    ];
    var _menuIcons = [
      "Bag_Icon.svg",
      "Card_Icon.svg",
      "Chat_Icon.svg",
      "NavigationBellOff.svg",
      "Settings_Icon.svg",
      "NavigationStarOff.svg"
    ];
    List<MenuItem> list = [];
    for (int i = 0; i < _menuIcons.length; i++) {
      list.add(MenuItem(
          title: _menuTitles[i],
          icon: _menuIcons[i],
          type: MenuType.values[i]));
    }
    return list;
  }
}
