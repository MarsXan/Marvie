import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';

class GalleryAddItem extends StatelessWidget {
  const GalleryAddItem({Key? key, required this.onTap}) : super(key: key);

  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: green50d,
        radius: const Radius.circular(cardBorderRadius),
        dashPattern: const [8, 4],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: green50d
                  ),
                  child:Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: greenGradient
                    ),
                    child: SvgPicture.asset('asset/icons/add_icon.svg',fit: BoxFit.none),
                  ) ,
                ),
                const SizedBox(height: 8,),
                const Text("Add new item",style: greenBodyStyle,textAlign: TextAlign.center,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
