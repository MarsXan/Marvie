import 'package:flutter/material.dart';
import 'package:marvie/core/components/buttons/custom_button.widget.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/text_styles.dart';

import 'login_input.widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkGreenGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, top: 90, right: 32),
              child: Column(
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
                              offset: Offset(0, 2),
                              blurRadius: 2)
                        ]),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    "Welcome!",
                    style: extraLargeTitleStyle,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Sign in to continue",
                    style: whiteNormalMediumHeadingStyle.copyWith(
                        color: darkGreen300d),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  const LoginInput(
                    iconColor: yellow300d,
                    hint: 'Username',
                    iconBackgroundColor: yellow50d,
                    icon: 'asset/icons/filled_user_icon.svg',
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: ),
                  //   child: const Divider(thickness: 2.5,color: darkGreen50d,),
                  // ),
                  const SizedBox(
                    height: 38,
                  ),
                  const LoginInput(
                    iconColor: red300d,
                    hint: 'Password',
                    iconBackgroundColor: red50d,
                    icon: 'asset/icons/lock_icon.svg',
                    isSecureText: true,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  CustomButton(
                    onPressed: () {},
                    title: "Sign in",
                    backGroundColor: green300d,
                    icon: 'asset/icons/next_icon.svg',
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Forgot password?",
                          style: darkGreenBodyStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  CustomButton(
                    onPressed: () {},
                    title: "Create an account",
                    titleColor: green300d,
                    backGroundColor: green50d,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
