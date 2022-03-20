import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/text_styles.dart';

class LoginInput extends StatefulWidget {
  const LoginInput(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.iconBackgroundColor,
      required this.hint,
      this.isSecureText = false})
      : super(key: key);

  final String icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String hint;
  final bool isSecureText;

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  late bool _isObscureText = widget.isSecureText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 38,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: widget.iconBackgroundColor),
          child: SvgPicture.asset(
            widget.icon,
            fit: BoxFit.none,
            color: widget.iconColor,
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Expanded(
            child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TextField(
              obscureText: _isObscureText,
              enableSuggestions: !_isObscureText,
              autocorrect: !_isObscureText,
              cursorColor: green300d,
              style: darkGreenInputStyle,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: darkGreenInputStyle,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: darkGreen50d, width: 1.5),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1.5),
                ),
                // suffixIcon: Icon(Icons.visibility)
              ),
            ),
            if (widget.isSecureText)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscureText = !_isObscureText;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, anim) => RotationTransition(
                            turns: child.key == const ValueKey('icon1')
                                ? Tween<double>(begin: 0.5, end: 1)
                                    .animate(anim)
                                : Tween<double>(begin: 1, end: 0.5)
                                    .animate(anim),
                            child: FadeTransition(opacity: anim, child: child),
                          ),
                      child: _isObscureText
                          ? SvgPicture.asset("asset/icons/invisible_icon.svg",
                              fit: BoxFit.contain,
                              width: 20,
                              height: 20,
                              color: darkGreen300d,
                              key: const ValueKey('icon1'))
                          : SvgPicture.asset("asset/icons/visibility_icon.svg",
                              fit: BoxFit.contain,
                              width: 20,
                              height: 20,
                              color: darkGreen300d,
                              key: const ValueKey('icon2'))),
                ),
              )
          ],
        ))
      ],
    );
  }
}
