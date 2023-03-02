part of 'add_card_bloc.dart';

@immutable
abstract class AddCardEvent {}

class UpdateFieldsEvent extends AddCardEvent {
  String? owner;
  String? cardNumber;
  String? expireDate;
  List<Color>? gradient;
  String? image;

  UpdateFieldsEvent({this.expireDate,this.image, this.gradient, this.cardNumber, this.owner});
}
