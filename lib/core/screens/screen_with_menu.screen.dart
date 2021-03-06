import 'package:flutter/material.dart';
import 'package:marvie/core/components/appbar.widget.dart';
import 'package:marvie/core/screens/empty.screen.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/presentation/menu/menu.screen.dart';
import 'package:marvie/presentation/menu/menu_type.dart';

class ScreenWithMenu extends StatefulWidget {
  const ScreenWithMenu(
      {Key? key,
      required this.body,
      this.gradient,
      this.backgroundColor,
      required this.selectedMenu,
      this.rightMenuItem})
      : super(key: key);
  final Widget body;
  final Gradient? gradient;
  final Color? backgroundColor;
  final MenuType selectedMenu;
  final Widget? rightMenuItem;

  @override
  State<ScreenWithMenu> createState() => _ScreenWithMenuState();
}

class _ScreenWithMenuState extends State<ScreenWithMenu>
    with SingleTickerProviderStateMixin {
  late final Duration _toggleDuration = const Duration(milliseconds: 250);
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: _toggleDuration);
  bool _canBeDragged = false;
  late var maxSlide = (MediaQuery.of(context).size.width - 60);
  final minDragstartEdge = 60;
  late var maxDragstartEdge = maxSlide - 16;
  late MenuType selectedMenuType = widget.selectedMenu;

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          double slide = maxSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.1);

          double slide2 = (maxSlide - 30) * _animationController.value;
          double scale2 = 1 - (_animationController.value * 0.15);

          double slide3 = (maxSlide - 45) * _animationController.value;
          double scale3 = 1 - (_animationController.value * 0.18);

          return Stack(
            children: [
              MenuScreen(
                selectedItem: selectedMenuType,
                onchangeItem: (item) {
                  setState(() {
                    selectedMenuType = item.type;
                  });
                },
              ),
              Transform(
                  transform: Matrix4.identity()
                    ..translate(slide3)
                    ..scale(scale3),
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      RotationTransition(
                          turns: Tween(begin: 0.0, end: -0.058)
                              .animate(_animationController),
                          child: const EmptyScreen(color: red300)),
                    ],
                  )),
              Transform(
                  transform: Matrix4.identity()
                    ..translate(slide2)
                    ..scale(scale2),
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      RotationTransition(
                          turns: Tween(begin: 0.0, end: -0.038)
                              .animate(_animationController),
                          child: const EmptyScreen(color: green300)),
                    ],
                  )),
              Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: RotationTransition(
                      turns: Tween(begin: 0.0, end: -0.025)
                          .animate(_animationController),
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(slide > 100 ? 45 : 0),
                          child: Container(
                            padding: const EdgeInsets.only(top: 60),
                            decoration: BoxDecoration(
                              gradient: widget.gradient,
                              color: widget.backgroundColor,
                            ),
                            child: widget.body,
                          ),
                        ),
                        SafeArea(
                          child: CustomAppBar(
                            leftView: IconButton(
                                onPressed: () {
                                  toggle();
                                },
                                icon: const Icon(
                                  Icons.menu_rounded,
                                  color: Colors.white,
                                )),
                            rightView: widget.rightMenuItem,
                          ),
                        )
                      ]))),
            ],
          );
        },
      ),
    ));
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  void close() => _animationController.reverse();

  void open() => _animationController.forward();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragstartEdge;
    bool isDragClosedFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragstartEdge;
    _canBeDragged = isDragClosedFromRight || isDragOpenFromLeft;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }
}
