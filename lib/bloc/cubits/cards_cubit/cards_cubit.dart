import 'package:banking_app/utils/file_importer/file_importer.dart';

part 'cards_state.dart';

class CardsCubit extends Cubit<CardsState> {
  CardsCubit() : super(CardsInitial()){
    getAllCards();
  }

  void getAllCards() async {
    MyResponse myResponse = MyResponse();
    emit(GettingCardInProgressState());
    myResponse = await getIt<CardsRepository>().getAllCards();
    if(myResponse.status.isEmpty){
      emit(GettingCardInSuccessState(cards: myResponse.cards!));
    }else{
      emit(GettingCardInFailuryState(status: myResponse.status));
    }
  }

  void deleteCard(String cardNumber)async{
   await  getIt<CardsRepository>().deleteCardById(cardNumber);
   getAllCards();
  }


}
