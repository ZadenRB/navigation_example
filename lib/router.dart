import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'screens/init_screen.dart';
import 'screens/main_screen.dart';
import 'screens/instructions_screen.dart';

class Router {
  static const String mainScreen = '/main';
  static const String initScreen = '/init';
  static const String instructions = '/instructions';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute<MainScreen>(
          builder: (_) => MainScreen(),
        );
      case initScreen:
        return MaterialPageRoute<InitScreen>(
          builder: (_) => InitScreen(),
        );
      case instructions:
        return MaterialPageRoute<InstructionsScreen>(
          builder: (_) => InstructionsScreen(),
        );
    }
  }
}
