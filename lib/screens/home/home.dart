import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        spacing: 20.0,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('painting_one');
            },
            child: const Text('Painting One'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('painting_two');
            },
            child: const Text('Painting Two'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('painting_three');
            },
            child: const Text('Painting Three'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('painting_four');
            },
            child: const Text('Painting Four'),
          ),
        ],
      ),
    );
  }
}
