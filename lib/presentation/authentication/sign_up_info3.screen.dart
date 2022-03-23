import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvie/core/components/buttons/direction_buttons.widget.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/presentation/store/store.screen.dart';

import 'authentication_header.widget.dart';
import 'authentication_input.widget.dart';

class SignUpInfo3Screen extends StatefulWidget {
  const SignUpInfo3Screen({Key? key}) : super(key: key);

  @override
  State<SignUpInfo3Screen> createState() => _SignUpInfo3ScreenState();
}

class _SignUpInfo3ScreenState extends State<SignUpInfo3Screen> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _repeatPassController = TextEditingController();

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
                    title: 'Hello!',
                    content: 'Mohsen Mokhtari',
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  AuthenticationInput(
                    iconColor: red300d,
                    hint: 'Create password',
                    iconBackgroundColor: red50d,
                    icon: 'asset/icons/lock_icon.svg',
                    controller: _passController,
                    isSecureText: true,
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  AuthenticationInput(
                    iconColor: red300d,
                    hint: 'Repeat your password',
                    iconBackgroundColor: red50d,
                    icon: 'asset/icons/lock_icon.svg',
                    controller: _repeatPassController,
                    isSecureText: true,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  DirectionButtons(onNextPress: () {
                    Get.to(() => const StoreScreen());
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
