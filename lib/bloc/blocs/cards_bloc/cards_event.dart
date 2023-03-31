part of 'cards_bloc.dart';

@immutable
abstract class CardsEvent {}

class GetAllCardsEvent extends CardsEvent{}
class DeleteCardByIdEvent extends CardsEvent{
  String cardNumber;
  DeleteCardByIdEvent(this.cardNumber);
}
