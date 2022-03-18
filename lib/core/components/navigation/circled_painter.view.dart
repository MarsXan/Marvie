import 'package:flutter/material.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:vector_math/vector_math.dart' as vm;

class CircledPainter extends CustomPainter {
  const CircledPainter({required this.strokeWidth, required this.progress});

  final double strokeWidth;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final inset = size.width * 0.18;

    final rect =
    Rect.fromLTRB(inset, inset, size.width - inset, size.height - inset);

    canvas.drawArc(
        rect,
        vm.radians(-180),
        vm.radians(360 * progress),
        false,
        Paint()
          ..shader = darkOrangeGradient.createShader(rect)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(CircledPainter oldDelegate) {
    if (oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth) {
      return true;
    }
    return false;
  }
}