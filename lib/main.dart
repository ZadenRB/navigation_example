import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/connection_bloc.dart';
import 'bloc/connection_event.dart';
import 'bloc/connection_state.dart';
import 'router.dart';
import 'screens/error_popup.dart';
import 'screens/init_screen.dart';
import 'screens/init_screen.dart';
import 'screens/instructions_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConnectionBloc()..add(ConnectionEvent.appStarted),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        builder: (context, child) {
          return BlocListener<ConnectionBloc, ConnectState>(
            listener: (context, state) {
              if (state == ConnectState.connected) {
                _navigator.pushAndRemoveUntil(MainScreen.route(), (_) => false);
              } else if (state == ConnectState.disconnected) {
                _navigator.pushAndRemoveUntil(
                    InstructionsScreen.route(), (_) => false);
              }
            },
            child: child,
          );
        },
        onGenerateRoute: (_) => InitScreen.route(),
      ),
    );
  }
}
