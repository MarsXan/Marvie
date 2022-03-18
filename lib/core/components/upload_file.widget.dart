import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

class UploadFile extends StatelessWidget {
  const UploadFile({Key? key, this.backGroundColor = red300}) : super(key: key);
  final Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(cardBorderRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upload file",
            style: whiteCardTitle,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "It looks like you are on track. Please continue to follow your daily plan",
            style: whiteCardContent,
          ),
          const SizedBox(
            height: 8,
          ),
          DottedBorder(
              borderType: BorderType.RRect,
              color: Colors.white,
              radius: const Radius.circular(cardBorderRadius),
              dashPattern: const [8, 4],
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 38),
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3)
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 68,
                    height: 68,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: SvgPicture.asset('asset/icons/upload_icon.svg'),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
