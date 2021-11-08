import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:painting_test/screens/painting_four/painter_four.dart';

class PaintingFourScreen extends StatefulWidget {
  const PaintingFourScreen({Key? key}) : super(key: key);

  @override
  _PaintingFourScreenState createState() => _PaintingFourScreenState();
}

class _PaintingFourScreenState extends State<PaintingFourScreen> {
  final List<Stroke> _strokes = <Stroke>[];

  List<Offset> _currentStrokePoints = <Offset>[];
  Color _currentColor = Colors.black;

  int _currentStrokeIndex = 0;
  late Stroke _currentStroke;

  @override
  void initState() {
    super.initState();
  }

  void _setupDraw() {
    final Stroke newStroke = Stroke()
      ..color = _currentColor
      ..points = <Offset>[];

    _strokes.add(newStroke);

    _currentStroke = newStroke;
    _currentStrokePoints = _currentStroke.points!;

    setState(() {});
  }

  void _draw(Offset locPos) {
    _currentStrokePoints.add(locPos);

    setState(() {});
  }

  Positioned _getCustomPainter() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTapDown: (TapDownDetails tdd) {
            _setupDraw();
          },
          onPanStart: (DragStartDetails dsd) {
            _setupDraw();
          },
          onLongPressMoveUpdate: (LongPressMoveUpdateDetails lpmud) {
            _draw(lpmud.localPosition);
          },
          onPanUpdate: (DragUpdateDetails dud) {
            _draw(dud.localPosition);
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.75,
            child: CustomPaint(
              painter: PaintingFourBackground(),
              foregroundPainter: PaintingFourForeground(_strokes),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _getColorOption(Color color) {
    return GestureDetector(
      onTap: () {
        _currentColor = color;
        setState(() {});
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 5.0,
            color: _currentColor == color ? Colors.white : Colors.transparent
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }

  Wrap _getPalette() {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 20,
      children: <Widget>[
        _getColorOption(Colors.green),
        _getColorOption(Colors.blue),
        _getColorOption(Colors.amber),
        _getColorOption(Colors.pink),
        _getColorOption(Colors.red),
        _getColorOption(Colors.orange),
        _getColorOption(Colors.teal),
        _getColorOption(Colors.lime),
        _getColorOption(Colors.purple),
      ],
    );
  }

  GestureDetector _getFunctions() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _strokes.clear();
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Icon(
          Icons.clear_rounded,
        ),
      ),
    );
  }

  Wrap _getCanvasFunctions() {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 20,
      children: <Widget>[_getFunctions()],
    );
  }

  Positioned _getPaintTools() {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      top: MediaQuery.of(context).size.height * .825,
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: <Widget>[
            _getPalette(),
            _getCanvasFunctions(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            _getCustomPainter(),
            _getPaintTools(),
          ],
        ),
      ),
    );
  }
}
