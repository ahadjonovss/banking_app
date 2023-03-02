import 'package:banking_app/bloc/cubits/cards_cubit/cards_cubit.dart';
import 'package:banking_app/data/repositories/cards_repository.dart';
import 'package:banking_app/data/repositories/storage_repository.dart';
import 'package:banking_app/service/local_db/local_db_sevice.dart';
import 'package:banking_app/service/notification_service/notification_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => LocalDatabase());
  getIt.registerLazySingleton(() => CardsRepository());
  getIt.registerLazySingleton(() => NotificationService());
  getIt.registerLazySingleton(() => CardsCubit());

}