import 'package:banking_app/bloc/blocs/add_card_bloc/add_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DesignWidget extends StatelessWidget {
  const DesignWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => ZoomTapAnimation(
          onTap: () {
            context.read<AddCardBloc>().add(UpdateFieldsEvent(image:"assets/$index.png" ));
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(top: 12),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/$index.png"),
                    fit: BoxFit.cover
                )
            ),
          ),
        ),),
    );
  }
}
