import 'package:flutter/material.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/text_styles.dart';

class AuthenticationHeader extends StatelessWidget {
  const AuthenticationHeader(
      {Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: green300d,
              boxShadow: [
                BoxShadow(
                    color: green300d.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 2)
              ]),
        ),
        const SizedBox(
          height: 28,
        ),
        Text(
          title,
          style: extraLargeTitleStyle,
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          content,
          style: whiteNormalMediumHeadingStyle.copyWith(color: darkGreen300d),
        )
      ],
    );
  }
}
