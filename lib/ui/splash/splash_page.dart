import 'package:banking_app/utils/router/routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed( const Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(context, home, (route) => false));
    return Scaffold();
  }
}
