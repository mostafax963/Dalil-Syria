import 'package:flutter/material.dart';

class TimelinePainter extends CustomPainter {
  final bool isFirst, isLast;
  final Color lineColor;

  TimelinePainter({
    required this.isFirst,
    required this.isLast,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = lineColor.withOpacity(0.3)
      ..strokeWidth = 2;

    final paintCircle = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;

    const double circleRadius = 5;
    final Offset circleCenter = Offset(size.width / 2, 20);

    if (!isFirst) {
      canvas.drawLine(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, circleCenter.dy - circleRadius),
        paintLine,
      );
    }
    if (!isLast) {
      canvas.drawLine(
        Offset(size.width / 2, circleCenter.dy + circleRadius),
        Offset(size.width / 2, size.height),
        paintLine,
      );
    }

    canvas.drawCircle(circleCenter, circleRadius, paintCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
