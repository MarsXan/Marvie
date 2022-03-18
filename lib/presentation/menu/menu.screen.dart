import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';
import 'package:marvie/presentation/menu/menu.card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _menuTitles = [
      "Shop",
      "Payment",
      "Chat",
      "Notifications",
      "Settings",
      "Rate Us"
    ];
    const _menuIcons = [
      "Bag_Icon.svg",
      "Card_Icon.svg",
      "Chat_Icon.svg",
      "NavigationBellOff.svg",
      "Settings_Icon.svg",
      "NavigationStarOff.svg"
    ];
    return Container(
      decoration: const BoxDecoration(gradient: darkGreenGradient),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 21,top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                color: darkGreen300d,
                radius: const Radius.circular(cardBorderRadius),
                dashPattern: const [8, 4],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        color: darkGreen50d,
                        borderRadius: BorderRadius.circular(cardBorderRadius)),
                    child: Container(
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'asset/images/dock2.svg',
                          fit: BoxFit.contain,
                          width: 48,
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
               Padding(
                padding: const EdgeInsets.only(left: 9),
                child: Row(
                  children: const [
                    Text(
                      "Shelly",
                      style: whiteMediumBoldHeadingStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 140,
                  padding: const EdgeInsets.only(top: 40),
                  child: ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MenuCard(
                          title: _menuTitles[index],
                          icon: _menuIcons[index],
                          onPress: (_) {},
                        );
                      }),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
