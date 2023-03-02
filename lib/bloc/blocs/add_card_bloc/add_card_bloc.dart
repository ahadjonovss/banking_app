import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_card_event.dart';
part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc()
      : super(
            AddCardState(image: "", gradient: [], cardNumber: "", owner: "",expireDate: "")) {
    on<UpdateFieldsEvent>(updateField);
  }

  void updateField(UpdateFieldsEvent event, emit) {
    emit(state.copyWith(
        gradient: event.gradient,
        expireDate: event.expireDate,
        image: event.image,
        cardNumber: event.cardNumber,
        owner: event.owner));
  }
}
