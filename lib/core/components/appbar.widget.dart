import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.leftView,
    this.rightView,
  }) : super(key: key);
  final Widget? leftView;
  final Widget? rightView;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (leftView != null) leftView!,
        if (rightView != null) rightView!,
      ],
    );
  }
}
