import 'package:flutter/material.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

import 'gallery_item.model.dart';

class GalleryHorizontalCard extends StatelessWidget {
  const GalleryHorizontalCard({Key? key, required this.item}) : super(key: key);
  final GalleryItem item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(cardBorderRadius),
      child: SizedBox(
        height: 200,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(
              image: AssetImage(item.image),
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                    const Color(0xFF0B0B0B).withOpacity(0.01),
                  const Color(0xFF0B0B0B).withOpacity(0.7),
                  ],
                      stops: const [
                    0.0,
                    1.0
                  ]),
              ),
              child: Opacity(
                opacity: 0.0,
                child: Image.asset(item.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 26),
              child: Text(
                item.title,
                style: whiteCardContent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
// 0B0B0B
