import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvie/core/theme/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.radius = 12.0,
      this.backgroundColor = green50d,
      this.height = 58,
      this.width = 58})
      : super(key: key);

  final String icon;
  final Function onPressed;
  final double radius;
  final Color backgroundColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
          onPressed: () {
            onPressed();
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: green50d,
          ),
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.none,
          )),
    );
  }
}
