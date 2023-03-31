part of 'cards_bloc.dart';

abstract class CardsState {}

class CardsInitial extends CardsState {}


class GettingCardInProgressState extends CardsState{}
class GettingCardInSuccessState extends CardsState{
  List<CardModel> cards;

  GettingCardInSuccessState({required this.cards});
}
class GettingCardInFailuryState extends CardsState{
  String status;

  GettingCardInFailuryState({required this.status});
}
