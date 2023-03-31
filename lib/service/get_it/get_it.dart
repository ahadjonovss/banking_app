import 'package:banking_app/utils/file_importer/file_importer.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => NotificationService());
  getIt.registerLazySingleton(() => LocalDatabase());
  getIt.registerLazySingleton(() => CardsRepository());
  getIt.registerLazySingleton(() => CardsBloc());

}