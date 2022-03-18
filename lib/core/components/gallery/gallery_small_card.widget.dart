import 'package:flutter/cupertino.dart';
import 'package:marvie/core/components/gallery/gallery_item.model.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

class GallerySmallCard extends StatelessWidget {
  const GallerySmallCard(
      {Key? key, required this.item, required this.backgroundColor})
      : super(key: key);

  final GalleryItem item;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: Container(
          height: 180,
          decoration: BoxDecoration(color: backgroundColor),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 120),
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.contain,
                      width: 80,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    item.title,
                    style: whiteCardContent,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
