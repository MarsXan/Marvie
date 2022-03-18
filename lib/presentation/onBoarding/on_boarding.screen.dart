import 'package:flutter/material.dart';
import 'package:marvie/core/components/buttons/custom_button.widget.dart';
import 'package:marvie/core/components/buttons/custom_icon_button.widget.dart';
import 'package:marvie/core/screens/screen_with_menu.screen.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/presentation/onBoarding/on_boarding.card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'oboarding.model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final _animationDuration = const Duration(milliseconds: 300);
  final _pageController =
  PageController(initialPage: 1, viewportFraction: 0.75);
  int _currentPage = 1;
  late final AnimationController _animationController =
  AnimationController(vsync: this, duration: _animationDuration);

  @override
  Widget build(BuildContext context) {
    return ScreenWithMenu(
      body: Container(
        decoration: const BoxDecoration(
          gradient: darkOrangeGradient,
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 65),
            child: Column(
              children: [
                SizedBox(
                  height: 535,
                  child: PageView.builder(
                      itemCount: onBoardingList.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return Transform.scale(
                          scale: Tween(
                              begin: index == _currentPage ? 1.0 : 0.9,
                              end: index == _currentPage ? 0.9 : 1.0)
                              .animate(_animationController)
                              .value,
                          child: AnimatedOpacity(
                            opacity: index == _currentPage ? 1 : 0.4,
                            duration: _animationDuration,
                            child: OnBoardingCard(
                              onBoardingModel: onBoardingList[index],
                            ),
                          ),
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      }),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onBoardingList.length,
                  effect: const WormEffect(
                    dotColor: darkGreen100d,
                    activeDotColor: green300d,
                    dotWidth: 9,
                    dotHeight: 9,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 8),
                  child: Row(
                    children: [
                      CustomIconButton(icon: 'asset/icons/previous_icon.svg', onPressed: (){},),
                      const SizedBox(width: 12,),
                      Expanded(
                        child: CustomGradientButton(title: 'Next', onPressed: (){},icon: 'asset/icons/next_icon.svg',)
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
