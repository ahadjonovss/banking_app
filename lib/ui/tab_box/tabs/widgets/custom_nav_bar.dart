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
          BottomNavigationBar(
            backgroundColor: Colors.black,
            onTap: (index){
              context.read<BottomNavCubit>().changePageIndex(index);
            },
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.white,
              items:const [
                BottomNavigationBarItem(icon: Icon(Icons.list),label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.payment),label: "")
              ] )
    );
  }
}
