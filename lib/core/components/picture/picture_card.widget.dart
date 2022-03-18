import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marvie/core/components/picture/picture.model.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

class PictureCard extends StatelessWidget {
  const PictureCard(
      {Key? key, this.backgroundColor = darkGreen50d, required this.item})
      : super(key: key);

  final Color? backgroundColor;
  final PictureItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(cardBorderRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Image.asset(
              item.picture,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width - 80,
              height: 150,
            ),
          ]),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                item.title,
                style: whiteCardTitle2.copyWith(
                    color:
                        // Get.isDarkMode ?
                        Colors.white
                    // : Colors.black
                    ),
              ),
              const Spacer(),
              SvgPicture.asset(
                "asset/icons/NavigationHeartOff.svg",
                fit: BoxFit.contain,
                width: 12,
                height: 12,
                color: darkGreen300d,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "${item.likesCount} likes",
                style:
                    // Get.isDarkMode
                    //     ? darkGreenCaptionStyleD
                    //     :
                    darkGreenBodyStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            item.caption,
            style: darkGreenCaptionStyleD,
          )
        ],
      ),
    );
  }
}
