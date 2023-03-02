import 'package:flutter/material.dart';

class CardModel {
  final String author;
  int? id;
  final num amount;
  final String expireDate;
  final String cardNumber;
  final String image;
  final List<Color> gradient;
  final bool isIdol;

  CardModel(
      {
        this.isIdol=false,
        this.amount=0,
        this.id = -8,
      required this.image,
      required this.cardNumber,
      required this.expireDate,
        required this.author,
      this.gradient =  const [Colors.white,Colors.white]});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      isIdol: json[CardModeFields.isIdol]==1?true:false,
      amount: json[CardModeFields.amount],
      author: json[CardModeFields.author]??"",
        id: json[CardModeFields.id],
        image: json[CardModeFields.image],
        cardNumber: json[CardModeFields.cardNumber],
        expireDate: json[CardModeFields.expireDate],
        gradient: [
          Color(json[CardModeFields.firstColor]),
          Color(json[CardModeFields.secondColor]),
        ]);
  }

  toJson() {
    return {
      CardModeFields.isIdol:isIdol,
      CardModeFields.amount:amount,
      CardModeFields.expireDate: expireDate,
      CardModeFields.author: author,
      CardModeFields.cardNumber: cardNumber,
      CardModeFields.image: image,
      CardModeFields.firstColor: gradient.length>1?gradient[0].value:Colors.white.value,
      CardModeFields.secondColor: gradient.length>1?gradient[1].value:Colors.white.value,
    };
  }

  copyWith(int newId) {
    return CardModel(
      author: author,
        image: image,
        cardNumber: cardNumber,
        expireDate: expireDate,
        id: newId,
        gradient: gradient);
  }
}

class CardModeFields {
  static const id = "id";
  static const isIdol = "isIdol";
  static const amount = "amount";
  static const author = "author";
  static const expireDate = "expireDate";
  static const cardNumber = "cardNumber";
  static const image = "image";
  static const firstColor = "firstColor";
  static const secondColor = "secondColor";
}
