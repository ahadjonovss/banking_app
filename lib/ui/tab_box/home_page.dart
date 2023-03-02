import 'package:banking_app/bloc/cubits/bottom_nav_cubit/navigation_cubit.dart';
import 'package:banking_app/ui/tab_box/tabs/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit,int>(
      builder: (context, state) => Scaffold(
        body: IndexedStack(
          index: context.read<BottomNavCubit>().activePageIndex,
          children: context.read<BottomNavCubit>().pages,
        ),
        bottomNavigationBar: CustomNavigationBar() ,
      ),
    );
  }
}
