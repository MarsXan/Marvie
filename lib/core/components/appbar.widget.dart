import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.onPress}) : super(key: key);
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              if (onPress != null){
              onPress!();
              }

            },
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
            ))
      ],
    );
  }
}
