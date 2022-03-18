import 'package:flutter/material.dart';
import 'package:marvie/core/theme/text_styles.dart';

import 'category.model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.item,
      this.backgroundColor,
      required this.onPress})
      : super(key: key);
  final Color? backgroundColor;
  final CategoryItem item;
  final Function(CategoryItem) onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: item.title.length < 4 ? 52 : null,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: backgroundColor,
        ),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
