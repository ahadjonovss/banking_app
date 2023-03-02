import 'package:banking_app/ui/card/add_card/add_card_page.dart';
import 'package:banking_app/ui/card/update_card/update_card_page.dart';
import 'package:banking_app/ui/splash/splash_page.dart';
import 'package:banking_app/ui/tab_box/home_page.dart';
import 'package:banking_app/ui/tab_box/tabs/cards/cards_page.dart';
import 'package:banking_app/ui/tab_box/tabs/payment/payment_page.dart';
import 'package:banking_app/utils/router/routes.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case  splash:
        return navigateTo(const SplashPage());
      case  home:
        return navigateTo(const HomePage());
      case  cards:
        return navigateTo(const CardsPage());
      case  payment:
        return navigateTo( PaymentPage());
      case  addCard:
        return navigateTo( AddCardPage());
      case  updateCard:
        return navigateTo(const UpdateCardPage());
      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
  builder: (context) => widget,
);