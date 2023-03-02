class CardModel{
  int? id;
  final String expireDate;
  final String cardNumber;
  final String image;
  final List<String> gradient;

  CardModel({
    this.id=-8,
    required this.image,
    required this.cardNumber,
    required this.expireDate,
     this.gradient = const ["",""]
});

  factory CardModel.fromJson(Map<String,dynamic> json){
    return CardModel(
      id: json[CardModeFields.id],
      image: json[CardModeFields.image],
      cardNumber: json[CardModeFields.cardNumber],
      expireDate: json[CardModeFields.expireDate],
      gradient: [json[CardModeFields.firstColor],json[CardModeFields.secondColor]]
    );
  }

  toJson(){
    return {
      CardModeFields.expireDate:expireDate,
      CardModeFields.cardNumber:cardNumber,
      CardModeFields.image:image,
      CardModeFields.firstColor:gradient[0],
      CardModeFields.secondColor:gradient[1],
    };
  }



}



class CardModeFields{
  static const id= "id";
  static const expireDate= "expireDate";
  static const cardNumber= "cardNumber";
  static const image= "image";
  static const firstColor= "firstColor";
  static const secondColor= "secondColor";
}







