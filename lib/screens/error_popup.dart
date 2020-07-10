import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<T> showErrorPopup<T>({
  @required BuildContext context,
  bool barrierDismissible = false,
  bool useRootNavigator = true,
  VoidCallback onPressed,
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
            child: Container(
              color: Colors.black,
              child: FlatButton(
                color: Colors.white,
                child: Text('Go to instructions'),
                onPressed: onPressed,
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
