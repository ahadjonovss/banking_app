import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:banking_app/bloc/cubits/bottom_nav_cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit,int>(
      builder: (context, state) =>
      AnimatedBottomNavigationBar(
        activeColor: Colors.white,
        inactiveColor: Colors.white.withOpacity(0.7),
        backgroundColor: Colors.blueAccent,
        icons: context.read<BottomNavCubit>().iconList,
        activeIndex: state,
        gapLocation: GapLocation.center,
        height: 80,
        iconSize: 28,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => context.read<BottomNavCubit>().changePageIndex(index),
        //other params
      ),
    );
  }
}
