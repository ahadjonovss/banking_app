import 'package:banking_app/utils/file_importer/file_importer.dart';

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
