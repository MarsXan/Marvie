import 'package:flutter/cupertino.dart';
import 'package:marvie/core/components/gallery/gallery_item.model.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

class GalleryMediumCard extends StatelessWidget {
  const GalleryMediumCard({Key? key, required this.item, required this.backgroundColor}) : super(key: key);

  final Color backgroundColor;
  final GalleryItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: Container(
          height: 210,
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
                      width: 90,

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
