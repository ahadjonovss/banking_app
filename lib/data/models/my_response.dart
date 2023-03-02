import 'package:banking_app/data/models/card_model.dart';

class MyResponse{
  List<CardModel>? cards;
  String status;

  MyResponse({this.status='',this.cards});
}