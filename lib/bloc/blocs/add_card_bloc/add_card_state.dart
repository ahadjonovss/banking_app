part of 'add_card_bloc.dart';

@immutable
class AddCardState extends Equatable {
  String owner;
  String cardNumber;
  List<Color> gradient;
  String image;
  String expireDate;

  AddCardState(
      {required this.image,
        required this.expireDate,
      required this.gradient,
      required this.cardNumber,
      required this.owner});

  copyWith({
    String? owner,
    String? cardNumber,
    List<Color>? gradient,
    String? image,
    String? expireDate
  }) {
    return AddCardState(
      expireDate: expireDate??this.expireDate,
      image: image??this.image,
      gradient: gradient??this.gradient,
      cardNumber: cardNumber??this.cardNumber,
      owner: owner??this.owner,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [owner, cardNumber, gradient, image];
}
