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
      body: Column(
        children: [
          TextButton(onPressed: () async {
            var id = await getIt<CardsRepository>().addCard(CardModel(image: "image", cardNumber: "cardNumber", expireDate: "expireDate",author: "Samandar"));
            print("ID : $id");

          }, child: const Text("Add Card")),
          TextButton(onPressed: () async {
            var id = await getIt<CardsRepository>().updateCard(CardModel(image: "image", cardNumber: "cardNumber", expireDate: "expireDate",author: "Mirzakarim",id: 4));
            print("ID : $id");

          }, child: const Text("Update Card")),
          TextButton(onPressed: () async {
            List<CardModel> cards = await getIt<CardsRepository>().getAllCards();
            print("Cards : ${cards[3].author}");

          }, child: Text("Get Card")),
        ],
      ),
    );
  }
}
