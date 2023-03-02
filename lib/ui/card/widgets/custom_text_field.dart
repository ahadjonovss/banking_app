import 'package:banking_app/utils/input_formatters/input_formatters.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String title;
  TextEditingController controller;
  CustomTextField({required this.controller,required this.title,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOwnerName = title=="Owner Name";
    Color titleColor = Colors.white;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:TextStyle(color: titleColor) ,),
        const SizedBox(height: 8,),
        Container(
          padding: const EdgeInsets.only(bottom: 6,left: 12),
          height: 40,
          width: 400,
          color: Colors.grey,
          child:  Center(
            child: TextField(
              keyboardType:isOwnerName?TextInputType.name:TextInputType.number,
              inputFormatters: [
                if(!isOwnerName)
                  cardFormatter
              ],
              controller: controller,
              decoration: const InputDecoration(
                  border: InputBorder.none
              ),
            ),
          ),
        ),


      ],
    );
  }
}
