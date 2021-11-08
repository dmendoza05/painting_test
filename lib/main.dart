import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:painting_test/screens/home/home.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:painting_test/screens/painting_four/painting_four_screen.dart';
import 'package:painting_test/screens/painting_one/painting_one_screen.dart';
import 'package:painting_test/screens/painting_three/painting_three_screen.dart';
import 'package:painting_test/screens/painting_two/painting_two_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Painting Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute<dynamic>(
              builder: (_) => const HomeScreen(),
            );
          case 'painting_one':
            return MaterialPageRoute<dynamic>(
              builder: (_) => const PaintingOneScreen(),
            );
          case 'painting_two':
            return MaterialPageRoute<dynamic>(
              builder: (_) => const PaintingTwoScreen(),
            );
          case 'painting_three':
            return MaterialPageRoute<dynamic>(
              builder: (_) => const PaintingThreeScreen(),
            );
          case 'painting_four':
            return MaterialPageRoute<dynamic>(
              builder: (_) => const PaintingFourScreen(),
            );
          default:
            return MaterialPageRoute<dynamic>(
                builder: (_) => const HomeScreen());
        }
      },
    );
  }
}
