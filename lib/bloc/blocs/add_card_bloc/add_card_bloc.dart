import 'dart:async';

import 'package:banking_app/data/models/card_model.dart';
import 'package:banking_app/data/repositories/cards_repository.dart';
import 'package:banking_app/service/get_it/get_it.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_card_event.dart';
part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc()
      : super(AddCardState(
            image: "",
            gradient: [],
            cardNumber: "",
            owner: "",
            expireDate: "",
            status: CardStatus.PURE)) {
    on<UpdateFieldsEvent>(updateField);
    on<AddCardToDbEvent>(addCardToDb);
  }

  void updateField(UpdateFieldsEvent event, emit) {
    emit(state.copyWith(
        gradient: event.gradient,
        expireDate: event.expireDate,
        image: event.image,
        cardNumber: event.cardNumber,
        status: CardStatus.PURE,
        owner: event.owner));
  }

  void addCardToDb(AddCardToDbEvent event, emit) async {
    if (state.expireDate.isNotEmpty &&
        state.cardNumber.length == 19 &&
        state.owner.isNotEmpty &&
        (state.image.isNotEmpty || state.gradient.isNotEmpty)) {
      emit(state.copyWith(status: CardStatus.ADDING));
      await getIt<CardsRepository>().addCard(CardModel(
          image: state.image,
          cardNumber: state.cardNumber,
          expireDate: state.expireDate,
          author: state.owner,
          gradient: state.gradient));
      emit(state.copyWith(status: CardStatus.DONE));
      resetState();
    }else{
      emit(state.copyWith(status: CardStatus.FAILURY));
    }
  }

  void resetState(){
    emit(state.copyWith(image: "",status: CardStatus.PURE,gradient: [],expireDate: "",cardNumber: "",owner: ""));
  }
}
