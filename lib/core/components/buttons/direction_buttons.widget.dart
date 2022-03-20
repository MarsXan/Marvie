import 'package:flutter/cupertino.dart';
import 'package:marvie/core/theme/colors.dart';

import 'custom_button.widget.dart';
import 'custom_icon_button.widget.dart';

class DirectionButtons extends StatelessWidget {
  const DirectionButtons(
      {Key? key,
      required this.onNextPress,
      required this.onPreviousPress,
      this.nextBtnTitle = "Next",
      this.nextBtnIcon = "asset/icons/next_icon.svg",
      this.prevBtnIcon = "asset/icons/previous_icon.svg"})
      : super(key: key);
  final String nextBtnTitle;
  final String? nextBtnIcon;
  final String prevBtnIcon;
  final Function onNextPress;
  final Function onPreviousPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: prevBtnIcon,
          onPressed: () {
            onPreviousPress();
          },
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: CustomButton(
          title: nextBtnTitle,
          gradient: greenGradient,
          onPressed: () {
            onNextPress();
          },
          icon: nextBtnIcon,
        )),
      ],
    );
  }
}
