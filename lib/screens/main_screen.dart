import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_example/bloc/connection_bloc.dart';
import 'package:navigation_example/bloc/connection_event.dart';
import 'package:navigation_example/bloc/connection_state.dart';

import 'error_popup.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ConnectionBloc, ConnectState>(
          listener: (BuildContext context, state) {
            if (state == ConnectState.disconnected) {
              showErrorPopup(context: context);
            }
          },
          builder: (BuildContext context, state) => Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              height: 50,
              child: FlatButton(
                color: Colors.white,
                child: Text('Trigger error'),
                onPressed: () => BlocProvider.of<ConnectionBloc>(context)
                    .add(ConnectionEvent.requestFailed),
              )));
}
