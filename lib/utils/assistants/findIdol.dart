
import 'package:banking_app/data/models/card_model.dart';

CardModel? findIdol(List<CardModel> cards, String cardNumber){
  for(var i in cards){
    if(i.cardNumber==cardNumber){
      return i;
    }
  }
  return null;

}