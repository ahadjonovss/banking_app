import 'package:banking_app/utils/file_importer/file_importer.dart';

class CardsRepository{
  Future addCard(CardModel cardModel) async {
    var id = await getIt<LocalDatabase>().addCard(cardModel);
    return cardModel.copyWith(id);
  }

  Future<int> updateCard(CardModel cardModel) async => await getIt<LocalDatabase>().updateCard(cardModel);

  Future<MyResponse> getAllCards() async => await getIt<LocalDatabase>().getAllCards();

  Future deleteCardById(String cardNumber) async => await getIt<LocalDatabase>().deleteCardById(cardNumber);


}