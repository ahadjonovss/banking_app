import 'package:banking_app/data/repositories/storage_repository.dart';
import 'package:banking_app/utils/router/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance.getToken().then((value) async {
      var shared = await SharedPreferences.getInstance();
      await shared.setString("token", value!);
      print("Token: $value");
    });
    Future.delayed( const Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(context, home, (route) => false));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Banking App"),
      ),
    );
  }
}
