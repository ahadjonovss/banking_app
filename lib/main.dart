import 'package:banking_app/app/app.dart';
import 'package:banking_app/app/bloc_observer.dart';
import 'package:banking_app/service/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
  Bloc.observer = AppBlocObserver();

  runApp(const App());
}

