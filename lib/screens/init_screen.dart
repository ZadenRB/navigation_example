import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InitScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => InitScreen(),
    );
  }

  @override
  Widget build(BuildContext context) => const SizedBox();
}
