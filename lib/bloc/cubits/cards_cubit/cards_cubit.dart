
import 'package:banking_app/data/models/card_model.dart';
import 'package:banking_app/data/models/my_response.dart';
import 'package:banking_app/data/repositories/cards_repository.dart';
import 'package:banking_app/service/get_it/get_it.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
