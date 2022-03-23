import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvie/core/components/buttons/direction_buttons.widget.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/presentation/authentication/sign_in.screen.dart';
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
      PageController(initialPage: 0, viewportFraction: 0.75);
  int _currentPage = 0;
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: _animationDuration);

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: darkOrangeGradient,
      ),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 65),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width > 400 ? 535 : 450,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: DirectionButtons(
                    nextBtnTitle: _currentPage < onBoardingList.length - 1
                        ? 'Next'
                        : 'Start',
                    nextBtnIcon: _currentPage < onBoardingList.length - 1
                        ? 'asset/icons/next_icon.svg'
                        : null,
                    onPreviousPress: () {
                      if (_currentPage > 0) {
                        setState(() {
                          _currentPage -= 1;
                        });
                        _pageController.animateToPage(_currentPage,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 300));
                      }
                    },
                    onNextPress: () {
                      if (_currentPage < onBoardingList.length - 1) {
                        setState(() {
                          _currentPage += 1;
                        });
                        _pageController.animateToPage(_currentPage,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 300));
                      } else {
                        Get.offAll(() => const SignInScreen());
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
