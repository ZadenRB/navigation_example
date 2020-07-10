import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_example/bloc/connection_bloc.dart';
import 'package:navigation_example/bloc/connection_event.dart';

class InstructionsScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => InstructionsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Column(children: <Widget>[
        Text('Instructions...',
            style: TextStyle(decoration: TextDecoration.none)),
        FlatButton(
            child: Text('Reconnect',
                style: TextStyle(decoration: TextDecoration.none)),
            color: Colors.white,
            onPressed: () {
              BlocProvider.of<ConnectionBloc>(context)
                  .add(ConnectionEvent.reconnect);
            }),
      ]));
}
