import 'package:banking_app/service/local_db/local_db_sevice.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => LocalDatabase());

}