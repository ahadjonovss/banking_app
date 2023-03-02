import 'package:banking_app/bloc/cubits/bottom_nav_cubit/navigation_cubit.dart';
import 'package:banking_app/service/get_it/get_it.dart';
import 'package:banking_app/service/notification_service/notification_service.dart';
import 'package:banking_app/ui/tab_box/tabs/widgets/custom_nav_bar.dart';
import 'package:banking_app/utils/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getIt<NotificationService>().handleFirebaseNotificationMessages();
    getIt<NotificationService>().setupInteractedMessage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit,int>(
      builder: (context, state) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ZoomTapAnimation(
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, addCard);

            },
          ),
        ),
        body: IndexedStack(
          index: context.read<BottomNavCubit>().activePageIndex,
          children: context.read<BottomNavCubit>().pages,
        ),
        bottomNavigationBar: CustomNavigationBar() ,
      ),
    );
  }
}
