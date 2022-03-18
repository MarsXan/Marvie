import 'package:flutter/cupertino.dart';
import 'package:marvie/core/components/gallery/gallery_item.model.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

class GalleryBigCard extends StatelessWidget {
  const GalleryBigCard({Key? key, required this.item, required this.backgroundColor, this.shapesColor}) : super(key: key);

  final Color backgroundColor;
  final Color? shapesColor;
  final GalleryItem item;

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
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 82,
                    height: 78,
                    decoration:  BoxDecoration(
                        color: shapesColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                  )),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 18,
                    height: 102,
                    decoration: BoxDecoration(
                        color: shapesColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(cardBorderRadius))),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(right: 38),
                    width: 82,
                    height: 78,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: shapesColor,
                    ),
                  )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.contain,
                    width: 200,
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
