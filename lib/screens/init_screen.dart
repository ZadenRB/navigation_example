import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_example/bloc/connection_state.dart';
import 'package:navigation_example/bloc/connection_bloc.dart';

import '../router.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocListener<ConnectionBloc, ConnectState>(
        listener: (context, state) {
          if (state == ConnectState.connected) {
            Navigator.pushReplacementNamed(context, Router.mainScreen);
          } else if (state == ConnectState.disconnected) {
            Navigator.pushReplacementNamed(context, Router.instructions);
          }
        },
        child: Container(),
      );
}
