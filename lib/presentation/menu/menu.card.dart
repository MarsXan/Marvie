
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/text_styles.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({Key? key, required this.title, required this.icon, required this.onPress})
      : super(key: key);

  final String title;
  final String icon;
  final Function(int) onPress;

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
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'asset/icons/$icon',
                color: darkGreen300d,
                width: 22,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: darkGreenCardTitle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
