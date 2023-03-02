import 'package:banking_app/bloc/cubits/cards_cubit/cards_cubit.dart';
import 'package:banking_app/data/models/card_model.dart';
import 'package:banking_app/data/repositories/cards_repository.dart';
import 'package:banking_app/service/get_it/get_it.dart';
import 'package:banking_app/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Cars Page"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(24),
        child: BlocBuilder<CardsCubit,CardsState>(
          builder: (context, state) {
            if(state is GettingCardInSuccessState){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.cards.length,
                itemBuilder: (context, index) => CardWidget(card: state.cards[index]),);
            }
            else if(state is GettingCardInProgressState){
              return Center(child: CircularProgressIndicator(),);
            }else{
              context.read<CardsCubit>().getAllCards();
              return Container();
            }
          },
        ),

      ),
    );
  }
}
