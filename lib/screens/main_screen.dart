import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_example/bloc/connection_bloc.dart';
import 'package:navigation_example/bloc/connection_event.dart';
import 'package:navigation_example/bloc/connection_state.dart';

import 'error_popup.dart';
import 'instructions_screen.dart';

class MainScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => MainScreen(),
    );
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<ConnectionBloc, ConnectState>(
        listener: (context, state) {
          if (state == ConnectState.failure) {
            showErrorPopup(
                context: context,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      InstructionsScreen.route(), (_) => false);
                });
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          height: 50,
          child: FlatButton(
            color: Colors.white,
            child: Text('Trigger error'),
            onPressed: () => context
                .bloc<ConnectionBloc>()
                .add(ConnectionEvent.requestFailed),
          ),
        ),
      );
}
