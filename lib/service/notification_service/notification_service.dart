import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService{

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  }

  handleFirebaseNotificationMessages() async {
    //Foregrounddan kelgan messagelarni tutib olamiz
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {

        // LocalNotificationService.localNotificationService.showNotification(id: 1, title: notificationModel.title, subtitle: notificationModel.description);
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