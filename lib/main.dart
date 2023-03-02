import 'package:banking_app/app/app.dart';
import 'package:banking_app/app/bloc_observer.dart';
import 'package:banking_app/data/repositories/storage_repository.dart';
import 'package:banking_app/service/get_it/get_it.dart';
import 'package:banking_app/service/notification_service/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.getInstance();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(getIt<NotificationService>().firebaseMessagingBackgroundHandler);
  setup();
  Bloc.observer = AppBlocObserver();

  runApp(const App());
}

