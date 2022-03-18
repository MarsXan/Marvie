import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key, required this.color})
      : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       color: color,
       borderRadius: BorderRadius.circular(45)
     ),
    );
  }
}
