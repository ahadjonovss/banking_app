import 'dart:async';

import 'package:banking_app/utils/file_importer/file_importer.dart';


part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc() : super(CardsInitial()) {
    on<GetAllCardsEvent>(getAllCards);
    on<DeleteCardByIdEvent>(deleteCard);
  }

  void getAllCards(event, emit) async {
    MyResponse myResponse = MyResponse();
    emit(GettingCardInProgressState());
    myResponse = await getIt<CardsRepository>().getAllCards();
    if(myResponse.status.isEmpty){
      emit(GettingCardInSuccessState(cards: myResponse.cards!));
    }else{
      emit(GettingCardInFailuryState(status: myResponse.status));
    }
  }

  void deleteCard(DeleteCardByIdEvent event, emit)async{
    await  getIt<CardsRepository>().deleteCardById(event.cardNumber);
    add(GetAllCardsEvent());
  }
}
