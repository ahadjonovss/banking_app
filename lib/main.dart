

import 'package:banking_app/utils/file_importer/file_importer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp();
  StorageRepository.getInstance();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  Bloc.observer = AppBlocObserver();

  runApp(const App());
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

}

