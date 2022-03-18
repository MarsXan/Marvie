import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvie/core/theme/colors.dart';
import 'dart:math' as math;

import 'circled_painter.view.dart';
import 'nav_item.dart';

class CircledNavigation extends StatefulWidget {
  const CircledNavigation(
      {Key? key,
      required this.itemList,
      required this.onItemChange,
      this.backGroundColor = darkGreen50d,
      this.animDuration = 300})
      : super(key: key);

  final List<NavItem> itemList;
  final Function(int index) onItemChange;
  final Color backGroundColor;
  final int animDuration;

  @override
  State<CircledNavigation> createState() => _CircledNavigationState();
}

class _CircledNavigationState extends State<CircledNavigation>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.animDuration));

  late final Tween<double> _valueTween = Tween<double>(begin: 0, end: 0.7);
  late final Animation<double> _positionAnimation = _valueTween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut))
    ..addListener(() {
      setState(() {});
    });

  late final AnimationController _fadeOutController = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.animDuration));

  late final Animation<double> _fadeMenuAnimation;

  String _menuIcon = 'asset/icons/menu_icon.svg';
  double _menuOpacity = 1;
  bool _isMenuVisible = false;
  bool _isCustomPaintVisible = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fadeMenuAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          _menuOpacity = _fadeOutController.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 5,
      child: AnimatedContainer(
        width: _isCustomPaintVisible ? 300 : 60,
        height: _isCustomPaintVisible ? 300 : 60,
        duration:  _isCustomPaintVisible ? const Duration(milliseconds: 50):const Duration(milliseconds: 100),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              foregroundPainter: CircledPainter(
                  strokeWidth: _isCustomPaintVisible ? 600 * 0.15 : 0,
                  progress: _positionAnimation.value),
              child: Container(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isCustomPaintVisible = true;
                        _isMenuVisible = !_isMenuVisible;
                        _menuIcon = _isMenuVisible
                            ? 'asset/icons/close_icon.svg'
                            : 'asset/icons/menu_icon.svg';
                      });
                      _fadeOutController.reset();
                      if (_animationController.isCompleted) {
                        _animationController.reverse();
                        Timer(const Duration(milliseconds: 300), () {
                          setState(() {
                            _isCustomPaintVisible = false;
                          });
                        });
                      } else {
                        _animationController.forward();
                      }
                      _fadeOutController.forward();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: darkOrangeGradient,
                          borderRadius: BorderRadius.circular(30)),
                      child: Opacity(
                        opacity: _menuOpacity,
                        child: SvgPicture.asset(
                          _menuIcon,
                          fit: BoxFit.none,
                          color: darkGreen300d,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              willChange: true,
            ),
            if (_isCustomPaintVisible)
              ButtonList(widget: widget, isMenuVisible: _isMenuVisible)
          ],
        ),
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  const ButtonList({
    Key? key,
    required this.widget,
    required bool isMenuVisible,
  }) : _isMenuVisible = isMenuVisible, super(key: key);

  final CircledNavigation widget;
  final bool _isMenuVisible;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 252,
      height: 252,
      child: Transform.rotate(
        angle: -0.4,
        child: Stack(
          alignment: Alignment.center,
          children: widget.itemList
              .asMap()
              .map((index, item) {
                var degree = 360 / 6 * index;
                var radian = degree * (math.pi / 180.0);
                return MapEntry(
                  index,
                  Align(
                    alignment: Alignment(
                      math.sin(radian),
                      math.cos(radian),
                    ),
                    child: Transform.rotate(
                        angle: 45,
                        child: AnimatedOpacity(
                          duration: _isMenuVisible
                              ? Duration(
                                  milliseconds:
                                      (widget.itemList.length -
                                              index) *
                                          100)
                              : Duration(milliseconds: index * 50),
                          opacity: _isMenuVisible ? 1.0 : 0.0,
                          child: Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: item.backgroundColor,
                                borderRadius:
                                    BorderRadius.circular(30)),
                            child: SvgPicture.asset(
                              item.icon,
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                );
              })
              .values
              .toList(),
        ),
      ),
    );
  }
}
