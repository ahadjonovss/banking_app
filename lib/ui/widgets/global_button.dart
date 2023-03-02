import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  String title;
  VoidCallback onTap;
  Color color;
  GlobalButton({required this.color,required this.title,required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,

      ),
      alignment: Alignment.center,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(title,style: const TextStyle(color: Colors.white,fontSize: 16),),

    );
  }
}
