import 'package:flutter/material.dart';

class PaintingFourForeground extends CustomPainter {
  PaintingFourForeground(this.strokes);

  List<Stroke> strokes;

  @override
  void paint(Canvas canvas, Size size) {
    // Base sizes and variables
    const double offsetCorners = 1;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Rect dimensions
    final double left = 0;
    final double right = size.width;
    final double top = 0;
    final double bottom = size.height;

    // Instantiate components
    Rect rect = Rect.fromLTRB(left, top, right, bottom);
    Paint brush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.clipRect(
      rect,
    );

    for (Stroke stroke in strokes) {
      Offset firstPoint;
      Offset? secondPoint;

      for (var i = 0; i < stroke.points!.length; i++) {
        firstPoint = stroke.points![i];
        secondPoint;

        if (i + 1 < stroke.points!.length) {
          secondPoint = stroke.points![i + 1];
        }

        if (secondPoint != null) {
          canvas.drawLine(firstPoint, secondPoint, brush..color = stroke.color);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PaintingFourBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Base sizes and variables
    const Color baseColor = Color(0xFFE8DED1);
    const Color baseColor2 = Color(0xFFE3D2BC);
    const double offsetCorners = 1;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Rect dimensions
    final double left = 0;
    final double right = size.width;
    final double top = 0;
    final double bottom = size.height;

    // Instantiate components
    Rect rect = Rect.fromLTRB(left, top, right, bottom);
    Paint brush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final colors = [baseColor2, baseColor, baseColor2];
    final stops = [-0.05, 0.5, 1.5];
    final gradient = LinearGradient(colors: colors, stops: stops);

    canvas.drawRect(
      rect,
      brush
        ..style = PaintingStyle.fill
        ..shader = gradient.createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Stroke {
  late List<Offset>? points;
  late Color color;
}
