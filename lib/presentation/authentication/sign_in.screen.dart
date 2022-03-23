import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvie/core/components/buttons/custom_button.widget.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/text_styles.dart';
import 'package:marvie/presentation/authentication/sign_up_info1.screen.dart';

import 'authentication_header.widget.dart';
import 'authentication_input.widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkGreenGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 32,
                  top: MediaQuery.of(context).size.width > 450 ? 90 : 60,
                  right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthenticationHeader(
                    title: 'Welcome!',
                    content: 'Sign in to continue',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width > 450 ? 37 : 20,
                  ),
                  AuthenticationInput(
                    iconColor: yellow300d,
                    hint: 'Username',
                    iconBackgroundColor: yellow50d,
                    icon: 'asset/icons/filled_user_icon.svg',
                    controller: _usernameController,
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  AuthenticationInput(
                    iconColor: red300d,
                    hint: 'Password',
                    iconBackgroundColor: red50d,
                    icon: 'asset/icons/lock_icon.svg',
                    isSecureText: true,
                    controller: _passController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width > 450 ? 64 : 44,
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
                    onPressed: () {
                      Get.to(() => const SignUpInfo1Screen());
                    },
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
