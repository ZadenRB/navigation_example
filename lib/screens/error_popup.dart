import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation_example/bloc/connection_bloc.dart';
import 'package:navigation_example/bloc/connection_state.dart';

import '../router.dart';

Future<T> showErrorPopup<T>({
  @required BuildContext context,
  bool barrierDismissible = false,
  bool useRootNavigator = true,
}) {
  assert(useRootNavigator != null, 'useRootNavigator must not be null');
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: DefaultTextStyle(
          style: TextStyle(decoration: TextDecoration.none),
          child: SafeArea(
            child: Builder(
              builder: (BuildContext context) =>
                  BlocConsumer<ConnectionBloc, ConnectState>(
                listener: (BuildContext context, state) {},
                builder: (BuildContext context, state) {
                  return Container(
                      color: Colors.black,
                      child: FlatButton(
                          color: Colors.white,
                          child: Text('Go to instructions'),
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, Router.initScreen)));
                },
              ),
            ),
          ),
        ),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: '',
    transitionDuration: Duration(milliseconds: 500),
    barrierColor: Colors.black54,
    useRootNavigator: useRootNavigator,
  );
}
