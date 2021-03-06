import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvie/core/theme/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.height = 58,
      this.radius = 12,
      this.icon,
      this.gradient,
      this.backGroundColor,
      this.titleColor = Colors.white})
      : super(key: key);
  final Function onPressed;
  final String title;
  final double height;
  final double radius;
  final String? icon;
  final Gradient? gradient;
  final Color? backGroundColor;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.all(0.0),
      ),
      child: Ink(
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          color: backGroundColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: whiteButtonTitle.copyWith(color: titleColor),
            ),
            if (icon != null)
              Row(
                children: [
                  const SizedBox(
                    width: 14,
                  ),
                  SvgPicture.asset(icon!)
                ],
              ),
          ],
        ),
      ),
    );
  }
}
