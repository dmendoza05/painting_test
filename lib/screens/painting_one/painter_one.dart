import 'dart:math';

import 'package:flutter/material.dart';

class PaintingOne extends CustomPainter {
  PaintingOne(
    this.line1,
    this.line2,
    this.line3,
    this.line4,
    this.line5,
  );

  int line1;
  int line2;
  int line3;
  int line4;
  int line5;

  @override
  void paint(Canvas canvas, Size size) {
    double basePosY = size.height * 0.2;

    double calqPosY(int n) {
      return (basePosY * n) - (basePosY * 0.5);
    }

    Offset lineOrigin(int n) {
      return Offset(size.width * 0.1, calqPosY(n));
    }

    Offset lineDestination(int n, int line) {
      final double newPosX = size.width * (0.1 + (line * 0.0075));
      final double maxPosX = min(newPosX, size.width * 0.9);
      return Offset(maxPosX, calqPosY(n));
    }

    var hourHandBrush = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20;

    canvas.drawLine(lineOrigin(1), lineDestination(1, line1), hourHandBrush..color = Colors.blue);
    canvas.drawLine(lineOrigin(2), lineDestination(2, line2), hourHandBrush..color = Colors.teal);
    canvas.drawLine(lineOrigin(3), lineDestination(3, line3), hourHandBrush..color = Colors.green);
    canvas.drawLine(lineOrigin(4), lineDestination(4, line4), hourHandBrush..color = Colors.amber);
    canvas.drawLine(lineOrigin(5), lineDestination(5, line5), hourHandBrush..color = Colors.purple);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
