import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:painting_test/screens/painting_one/painter_one.dart';

class PaintingOneScreen extends StatefulWidget {
  const PaintingOneScreen({Key? key}) : super(key: key);

  @override
  _PaintingOneScreenState createState() => _PaintingOneScreenState();
}

class _PaintingOneScreenState extends State<PaintingOneScreen> {
  int line1 = 0;
  int line2 = 0;
  int line3 = 0;
  int line4 = 0;
  int line5 = 0;
  String activeLine = '';

  Timer? toggleble;

  late Timer timer;

  void toggleTimer(String toggledLine, dynamic funk) {
    final String previousActiveLine = activeLine;
    activeLine = toggledLine;

    if (toggleble != null && previousActiveLine != toggledLine) {
      toggleble!.cancel();
      toggleble = null;
      toggleble =
          toggleble ?? Timer.periodic(const Duration(milliseconds: 50), funk);
    } else if (toggleble != null &&
        toggleble!.isActive &&
        previousActiveLine == toggledLine) {
      toggleble!.cancel();
      toggleble = null;
      activeLine = '';
      // if (!activeLine.isEmpty || activeLine == toggledLine) {
      // }
      setState(() {});
    } else {
      toggleble = Timer.periodic(const Duration(milliseconds: 50), funk);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                child: CustomPaint(
                  painter: PaintingOne(
                    line1,
                    line2,
                    line3,
                    line4,
                    line5,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      toggleTimer('line1', (_) {
                        setState(() {
                          line1++;
                        });
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.blue,
                      transform: Matrix4.translationValues(
                        0,
                        activeLine == 'line1' ? -40 : 0,
                        0,
                      ),
                      child: const Center(child: Text('1')),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toggleTimer('line2', (_) {
                        setState(() {
                          line2++;
                        });
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.teal,
                      transform: Matrix4.translationValues(
                        0,
                        activeLine == 'line2' ? -40 : 0,
                        0,
                      ),
                      child: const Center(child: Text('2')),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toggleTimer('line3', (_) {
                        setState(() {
                          line3++;
                        });
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.green,
                      transform: Matrix4.translationValues(
                        0,
                        activeLine == 'line3' ? -40 : 0,
                        0,
                      ),
                      child: const Center(child: Text('3')),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toggleTimer('line4', (_) {
                        setState(() {
                          line4++;
                        });
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.amber,
                      transform: Matrix4.translationValues(
                        0,
                        activeLine == 'line4' ? -40 : 0,
                        0,
                      ),
                      child: const Center(child: Text('4')),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toggleTimer('line5', (_) {
                        setState(() {
                          line5++;
                        });
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.purple,
                      transform: Matrix4.translationValues(
                        0,
                        activeLine == 'line5' ? -40 : 0,
                        0,
                      ),
                      child: const Center(child: Text('5')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

    @override
  void dispose() {
    super.dispose();
  }
}
