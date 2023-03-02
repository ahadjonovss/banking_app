
import 'package:banking_app/ui/tab_box/tabs/cards/cards_page.dart';
import 'package:banking_app/ui/tab_box/tabs/payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);
  int activePageIndex = 0;

  List<IconData> iconList=[
    Icons.card_membership,
    Icons.payment,
  ];

  List<Widget> pages =[
    CardsPage(),
    PaymentPage()
  ];

  void changePageIndex(int newIndex) {
    emit(activePageIndex = newIndex);
  }
}
