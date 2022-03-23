import 'package:flutter/material.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/text_styles.dart';

import 'category.model.dart';

class CategoryVertCard extends StatelessWidget {
  const CategoryVertCard({
    Key? key,
    required this.item,
    this.backgroundColor = darkGreen50d,
    required this.onPress,
  }) : super(key: key);
  final Color backgroundColor;
  final CategoryItem item;
  final Function(CategoryItem) onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress(item);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 19),
        padding: const EdgeInsets.only(top: 9),
        height: 146,
        width: 82,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(41)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 66,
              height: 66,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Text(
                item.emoji!,
                style: whiteBodyStyle.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              item.title,
              style: whiteBodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
