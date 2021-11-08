import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:painting_test/screens/painting_two/painter_two.dart';

class PaintingTwoScreen extends StatefulWidget {
  const PaintingTwoScreen({Key? key}) : super(key: key);

  @override
  _PaintingTwoScreenState createState() => _PaintingTwoScreenState();
}

class _PaintingTwoScreenState extends State<PaintingTwoScreen>
    with TickerProviderStateMixin {
  late final Ticker _ticker;

  int _incrementor = 0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _incrementor++;
      });
    });
  }

  Positioned _getCustomPainter() {
    return Positioned(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomPaint(
            painter: PaintingTwo(_incrementor),
          ),
        ),
      ),
    );
  }

  List<Widget> _getButtons() {
    final double centerX = MediaQuery.of(context).size.width * 0.5;
    final double centerY = MediaQuery.of(context).size.height * 0.1;

    return <Widget>[
      Positioned(
        bottom: centerY,
        right: centerX + (centerX * 0.1),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          child: const Icon(Icons.play_arrow),
          onPressed: () async {
            if (!_ticker.isActive) {
              _ticker.start();
            } else if (!_ticker.isTicking) {
              _ticker.muted = false;
            }
          },
        ),
      ),
      Positioned(
        bottom: centerY,
        left: centerX + (centerX * 0.1),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.red,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          child: const Icon(Icons.close),
          onPressed: () async {
            if (_ticker.isActive) {
              _ticker.stop();
              setState(() {});
            }
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                _getCustomPainter(),
                ..._getButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
