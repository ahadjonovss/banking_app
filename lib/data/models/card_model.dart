class CardModel {
  final String author;
  int? id;
  final num amount;
  final String expireDate;
  final String cardNumber;
  final String image;
  final List<String> gradient;

  CardModel(
      {
        this.amount=0,
        this.id = -8,
      required this.image,
      required this.cardNumber,
      required this.expireDate,
        required this.author,
      this.gradient = const ["", ""]});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      amount: json[CardModeFields.amount],
      author: json[CardModeFields.author]??"",
        id: json[CardModeFields.id],
        image: json[CardModeFields.image],
        cardNumber: json[CardModeFields.cardNumber],
        expireDate: json[CardModeFields.expireDate],
        gradient: [
          json[CardModeFields.firstColor],
          json[CardModeFields.secondColor]
        ]);
  }

  toJson() {
    return {
      CardModeFields.amount:amount,
      CardModeFields.expireDate: expireDate,
      CardModeFields.author: author,
      CardModeFields.cardNumber: cardNumber,
      CardModeFields.image: image,
      CardModeFields.firstColor: gradient[0],
      CardModeFields.secondColor: gradient[1],
    };
  }

  copyWith(int id) {
    return CardModel(
      author: author,
        image: image,
        cardNumber: cardNumber,
        expireDate: expireDate,
        id: id,
        gradient: gradient);
  }
}

class CardModeFields {
  static const id = "id";
  static const amount = "amount";
  static const author = "author";
  static const expireDate = "expireDate";
  static const cardNumber = "cardNumber";
  static const image = "image";
  static const firstColor = "firstColor";
  static const secondColor = "secondColor";
}
