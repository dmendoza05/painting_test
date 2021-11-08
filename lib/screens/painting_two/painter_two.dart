import 'package:flutter/material.dart';

class PaintingTwo extends CustomPainter {
  PaintingTwo(this.mover);

  final int mover;

  @override
  void paint(Canvas canvas, Size size) {
    // Base sizes and variables
    const double offsetCorners = 0.5;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Rect dimensions
    final double left = centerX * (1 - offsetCorners);
    final double right = centerX * (1 + offsetCorners);
    final double top = centerY * (1 - offsetCorners);
    final double bottom = centerY * (1 + offsetCorners);

    // Line Ends Coordinates
    Offset pointA = Offset(left, top);
    Offset pointB = Offset(left, bottom);

    // Instantiate components
    Rect rect = Rect.fromLTRB(left, top, right, bottom);
    Paint brush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    MovingLine line1 = MovingLine.fomOffset(pointA, pointB)
      ..moveX(rect.width, mover * 1.2);

    MovingLine line2 = MovingLine.fromPoints(right, top, right, bottom)
      ..moveX(rect.width, mover * -1.2);

    MovingLine line3 = MovingLine.fromPoints(left, top, right, top)
      ..moveY(rect.height, mover * 1.2);

    MovingLine line4 = MovingLine.fromPoints(left, bottom, right, bottom)
      ..moveY(rect.height, mover * -1.2);

    canvas.drawRect(rect, brush);
    canvas.drawLine(line1.pointA, line1.pointB, brush..color = Colors.amber);
    canvas.drawLine(line2.pointA, line2.pointB, brush..color = Colors.amber);
    canvas.drawLine(line3.pointA, line3.pointB, brush..color = Colors.pink);
    canvas.drawLine(line4.pointA, line4.pointB, brush..color = Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MovingLine {
  late Offset pointA;
  late Offset pointB;

  double? _p1x;
  double? _p1y;
  double? _p2x;
  double? _p2y;

  MovingLine.fomOffset(this.pointA, this.pointB);
  MovingLine.fromPoints(this._p1x, this._p1y, this._p2x, this._p2y) {
    pointA = Offset(_p1x!, _p1y!);
    pointB = Offset(_p2x!, _p2y!);
  }

  moveX(double bounds, double velocity) {
    final double movingCoordinate = velocity.sign * (velocity.abs() % bounds);
    pointA = Offset(movingCoordinate + pointA.dx, pointA.dy);
    pointB = Offset(movingCoordinate + pointB.dx, pointB.dy);
  }

  moveY(double bounds, double velocity) {
    final double movingCoordinate = velocity.sign * (velocity.abs() % bounds);
    pointA = Offset(pointA.dx, movingCoordinate + pointA.dy);
    pointB = Offset(pointB.dx, movingCoordinate + pointB.dy);
  }
}
