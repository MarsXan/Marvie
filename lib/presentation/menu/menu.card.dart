
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/text_styles.dart';
import 'package:marvie/presentation/menu/menu_item.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(
      {Key? key,
      required this.menuItem,
      required this.onPress,
      this.isSelected = false})
      : super(key: key);

  final MenuItem menuItem;
  final Function(MenuItem) onPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
        ),
        onPressed: () {
          onPress(menuItem);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'asset/icons/${menuItem.icon}',
                color: isSelected ? green300d : darkGreen300d,
                width: 22,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                menuItem.title,
                style: darkGreenCardTitle.copyWith(
                    color: isSelected ? green300d : darkGreen300d),
              )
            ],
          ),
        ),
      ),
    );
  }
}
