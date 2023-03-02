import 'package:banking_app/bloc/blocs/add_card_bloc/add_card_bloc.dart';
import 'package:banking_app/bloc/cubits/bottom_nav_cubit/navigation_cubit.dart';
import 'package:banking_app/utils/router/router.dart';
import 'package:banking_app/utils/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_year_picker/month_year_picker.dart';
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit(),),
        BlocProvider(create: (context) => AddCardBloc(),),
      ],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        MonthYearPickerLocalizations.delegate,

      ],
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: splash,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
