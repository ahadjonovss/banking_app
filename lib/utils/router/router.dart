import 'package:banking_app/utils/file_importer/file_importer.dart';

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