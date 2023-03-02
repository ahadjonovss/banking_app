part of 'add_card_bloc.dart';

@immutable
// ignore: must_be_immutable
class AddCardState extends Equatable {
  String owner;
  String cardNumber;
  List<Color> gradient;
  String image;
  String expireDate;
  CardStatus? status;

  AddCardState(
      {required this.image,
        required this.expireDate,
        required this.status,
      required this.gradient,
      required this.cardNumber,
      required this.owner});

  copyWith({
    CardStatus? status,
    String? owner,
    String? cardNumber,
    List<Color>? gradient,
    String? image,
    String? expireDate
  }) {
    return AddCardState(
      status: status??this.status,
      image: image??this.image,
      gradient: gradient??this.gradient,
      cardNumber: cardNumber??this.cardNumber,
      owner: owner??this.owner,
      expireDate: expireDate??this.expireDate,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [owner, cardNumber, gradient, image,expireDate,status];
}


enum CardStatus{
  // ignore: constant_identifier_names
  PURE,
  // ignore: constant_identifier_names
  ADDING,
  // ignore: constant_identifier_names
  DONE,
  // ignore: constant_identifier_names
  FAILURY
}
