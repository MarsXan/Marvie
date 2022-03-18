import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavItem {
  String title;
  String icon;
  Color backgroundColor;

  NavItem(
      {required this.title,
      required this.icon,
      this.backgroundColor = Colors.transparent});
}
