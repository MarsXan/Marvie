import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';
import 'package:marvie/presentation/onBoarding/on_boarding.screen.dart';

class HiScreen extends StatefulWidget {
  const HiScreen({Key? key}) : super(key: key);

  @override
  State<HiScreen> createState() => _HiScreenState();
}


class _HiScreenState extends State<HiScreen> {
  var isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (){
      if (isLoggedIn){
        Get.off(()=>const OnBoardingScreen());
      }else{
        Get.off(()=>const OnBoardingScreen());
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [red300d, red400d]),
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width > 400 ? 45 : 20)),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 140,
                height: 140,
                decoration: const BoxDecoration(
                    color: red400,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(cardBorderRadius),
                        bottomLeft: Radius.circular(cardBorderRadius))),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width > 400 ? 180 : 80),
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                    color: red400d,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 80),
                width: 164,
                height: 164,
                decoration:  BoxDecoration(
                    color: red400d,
                    borderRadius: BorderRadius.circular(cardBorderRadius)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width > 400 ? 190 : 80,
                  left: 32,
                  right: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Marvie \nIOS UI Kit",
                        style: whiteLargeHeadingStyle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Now it’s dark 🌚",
                        style: whiteMediumHeadingStyle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Marvie is your top-notch multipurpose UI kit with bright and friendly colors. Full-featured and handy. Trendy and eye-catching. Created with care of designers and users.",
                        style: whiteLargeBodyStyle,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image(
                    image: const AssetImage('asset/images/group_dogs.png'),
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width > 400 ? 160 : 120,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
