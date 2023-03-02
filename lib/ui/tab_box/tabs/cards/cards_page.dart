import 'package:banking_app/data/models/card_model.dart';
import 'package:banking_app/data/repositories/cards_repository.dart';
import 'package:banking_app/service/get_it/get_it.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cars Page"),
      ),
      body: Container(),
    );
  }
}
