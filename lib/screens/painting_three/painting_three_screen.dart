import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class PaintingThreeScreen extends StatefulWidget {
  const PaintingThreeScreen({Key? key}) : super(key: key);

  @override
  _PaintingThreeScreenState createState() => _PaintingThreeScreenState();
}

class _PaintingThreeScreenState extends State<PaintingThreeScreen>
    with TickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
      });
    });
  }

  Positioned _getTimerMinutes() {
    return Positioned(
      top: 0,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.orange[800]!.withAlpha(200),
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            '${_elapsed.inMinutes.remainder(60)}'.padLeft(2, '0'),
            style: const TextStyle(fontSize: 60000, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Positioned _getTimerSeconds() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.orange[600]!.withAlpha(200),
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            '${_elapsed.inSeconds.remainder(60)}'.padLeft(2, '0'),
            style: const TextStyle(fontSize: 60000, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Positioned _getTimerMiliseconds() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.6,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.orange[400]!.withAlpha(200),
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            '${_elapsed.inMilliseconds.remainder(60)}'.padLeft(2, '0'),
            style: const TextStyle(fontSize: 60000, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: GestureDetector(
            onTap: () {
              print('rap');
              if (_ticker.isActive) {
                _ticker.stop();
                setState(() {
                  _elapsed = Duration.zero;
                });
                return;
              }

              if (!_ticker.isActive) {
                _ticker.start();
              } else if (!_ticker.isTicking) {
                _ticker.muted = false;
              }
            },
            child: Stack(
              children: <Widget>[
                _getTimerMinutes(),
                _getTimerSeconds(),
                _getTimerMiliseconds(),
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
