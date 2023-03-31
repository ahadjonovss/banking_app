import 'package:banking_app/utils/file_importer/file_importer.dart';

class NotificationService{

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  }

  handleFirebaseNotificationMessages() async {
    //Foregrounddan kelgan messagelarni tutib olamiz
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.notification != null) {
        await getIt<LocalDatabase>().updateSum(message.data["cardNumber"], int.parse(message.data["amount"]));

        LocalNotificationService.localNotificationService.showNotification(id: Random().nextInt(100), title: "Sizga pul kelib tushdi", subtitle: "Kirib xabar oling");
        getIt<CardsBloc>().add(GetAllCardsEvent());
      }
    });
  }

  setupInteractedMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();


    //Terminateddan kirganda bu ishlaydi
    if (initialMessage != null) {

    }

    //Backgounddan kirganda shu ishlaydi
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("On app ishladi");
    });
  }

}