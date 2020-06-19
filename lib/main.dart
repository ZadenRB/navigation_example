import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/connection_bloc.dart';
import 'bloc/connection_event.dart';
import 'router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ConnectionBloc()..add(ConnectionEvent.appStarted),
        child: MaterialApp(
          builder: (context, child) => child,
          initialRoute: Router.initScreen,
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
