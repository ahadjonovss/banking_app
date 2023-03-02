import 'package:banking_app/data/models/card_model.dart';
import 'package:banking_app/data/models/my_response.dart';
import 'package:banking_app/service/get_it/get_it.dart';
import 'package:banking_app/service/local_db/local_db_sevice.dart';

class CardsRepository{
  Future addCard(CardModel cardModel) async {
    var id = await getIt<LocalDatabase>().addCard(cardModel);
    return cardModel.copyWith(id);
  }

  Future<int> updateCard(CardModel cardModel) async => await getIt<LocalDatabase>().updateCard(cardModel);

  Future<MyResponse> getAllCards() async => await getIt<LocalDatabase>().getAllCards();

  Future deleteCardById(String cardNumber) async => await getIt<LocalDatabase>().deleteCardById(cardNumber);


}