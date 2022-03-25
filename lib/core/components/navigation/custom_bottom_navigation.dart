import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/dimentions.dart';

import 'nav_item.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation(
      {Key? key,
      required this.itemList,
      required this.onItemChange,
      this.selectedItem = 1,
      this.selectedItemBackGround = green300,
      this.backGroundColor = darkGreen50d,
      this.animDuration = 300,
      this.controller})
      : super(key: key);
  final List<NavItem> itemList;
  final Function(int index) onItemChange;
  final int selectedItem;
  final Color selectedItemBackGround;
  final Color backGroundColor;
  final int animDuration;
  final TabController? controller;

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation>
    with TickerProviderStateMixin {
  double fabIconAlpha = 1;
  late int _selectedItem = widget.selectedItem;
  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.animDuration));
  late final Tween<double> _positionTween =
      Tween<double>(begin: _calcAnimValue(_selectedItem), end: 0);

  late final Animation<double> _positionAnimation = _positionTween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut))
    ..addListener(() {
      setState(() {});
    });

  late final AnimationController _fadeOutController = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.animDuration));
  late final Animation<double> _fadeFabAnimation;

  @override
  void initState() {
    super.initState();
    _fadeFabAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeOutController.value;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16, left: 32, right: 32),
      decoration: BoxDecoration(
          color: widget.backGroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(cardBorderRadius), topRight: Radius.circular(cardBorderRadius))),
      height: 96,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _getNavItemList(),
          ),
          IgnorePointer(
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Align(
                heightFactor: 1,
                alignment: Alignment(_positionAnimation.value, 0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: widget.selectedItemBackGround,
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: fabIconAlpha,
                        child: SvgPicture.asset(
                          widget.itemList[_selectedItem].icon,
                          fit: BoxFit.contain,
                          width: 20,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _initAnimationAndStart(double from, double to) {
    _positionTween.begin = from;
    _positionTween.end = to;

    _animationController.reset();
    _fadeOutController.reset();
    _animationController.forward();
    _fadeOutController.forward();
  }

  List<Widget> _getNavItemList() {
    return widget.itemList
        .map((e) => GestureDetector(
              onTap: () {
                var index = widget.itemList.indexOf(e);
                widget.onItemChange(index);
                _selectedItem = index;
                _initAnimationAndStart(
                    _positionAnimation.value, _calcAnimValue(index));
                widget.controller?.animateTo(index);
              },
              child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    e.icon,
                    fit: BoxFit.contain,
                    width: 20,
                  )),
            ))
        .toList();
  }

  double _calcAnimValue(int selectedIndex) {
    return ((2 / (widget.itemList.length - 1)) * selectedIndex) - 1;
  }
}
