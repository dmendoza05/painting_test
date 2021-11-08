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

  @override
  void initState() {
    super.initState();
  }

  Positioned _getCustomPainter() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTap: () {},
          onLongPress: () {
            print('gesture');
            // print('ddd ${ddd.globalPosition}');
          },
          onLongPressDown: (LongPressDownDetails lpdd) {
            print('lpdd ${lpdd.globalPosition} ${lpdd.localPosition}');
          },
          onLongPressMoveUpdate: (LongPressMoveUpdateDetails lpmud) {
            print('lpmud ${lpmud.globalPosition} ${lpmud.localPosition} ${lpmud.localOffsetFromOrigin}');
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.75,
            child: CustomPaint(
              painter: PaintingFourBackground(),
              foregroundPainter: PaintingFourForeground(),
            ),
          ),
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
          ],
        ),
      ),
    );
  }
}
