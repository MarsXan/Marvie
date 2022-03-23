import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvie/core/components/buttons/direction_buttons.widget.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/presentation/authentication/sign_up_info2.screen.dart';

import 'authentication_header.widget.dart';
import 'authentication_input.widget.dart';

class SignUpInfo1Screen extends StatefulWidget {
  const SignUpInfo1Screen({Key? key}) : super(key: key);

  @override
  State<SignUpInfo1Screen> createState() => _SignUpInfo1ScreenState();
}

class _SignUpInfo1ScreenState extends State<SignUpInfo1Screen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
                  top: MediaQuery.of(context).size.width > 400 ? 90 : 60,
                  right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthenticationHeader(
                    title: 'Hello!',
                    content: 'lets introduce',
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  AuthenticationInput(
                    iconColor: yellow300d,
                    hint: 'Your full name',
                    iconBackgroundColor: yellow50d,
                    icon: 'asset/icons/filled_user_icon.svg',
                    controller: _fullNameController,
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  AuthenticationInput(
                    iconColor: yellow300d,
                    hint: 'Username',
                    iconBackgroundColor: yellow50d,
                    icon: 'asset/icons/filled_user_icon.svg',
                    controller: _usernameController,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  DirectionButtons(onNextPress: () {
                    Get.to(() => const SignUpInfo2Screen());
                  }, onPreviousPress: () {
                    Get.back();
                  }),
                  const SizedBox(
                    height: 18,
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
