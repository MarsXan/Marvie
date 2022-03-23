import 'package:flutter/material.dart';
import 'package:marvie/core/theme/text_styles.dart';

import 'category.model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.item,
      this.backgroundColor,
      required this.onPress,
      this.width,
      this.padding = 24})
      : super(key: key);
  final Color? backgroundColor;
  final CategoryItem item;
  final Function(CategoryItem) onPress;

  final double? width;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: 52,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size(52, 52),
          padding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: backgroundColor,
        ),
        onPressed: () {
          onPress(item);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: padding),
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (item.emoji != null)
                Row(
                  children: [
                    Text(
                      item.emoji!,
                      style: whiteBodyStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              Text(
                item.title,
                style: whiteBodyStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
