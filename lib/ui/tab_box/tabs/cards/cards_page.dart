import 'package:banking_app/bloc/cubits/cards_cubit/cards_cubit.dart';
import 'package:banking_app/data/repositories/storage_repository.dart';
import 'package:banking_app/ui/widgets/card_widget.dart';
import 'package:banking_app/utils/assistants/findIdol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service/get_it/get_it.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Cars Page"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<CardsCubit,CardsState>(
          builder: (context, state) {
            if(state is GettingCardInSuccessState){
              return Column(
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.cards.length,
                    itemBuilder: (context, index) => CardWidget(card: state.cards[index]),)
                ],
              );
            }
            else if(state is GettingCardInProgressState){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is GettingCardInFailuryState){
              return Center(child: Text(state.status,style: TextStyle(color: Colors.white),),);
            }
            else{
              // context.read<CardsCubit>().getAllCards();
              return Container();
            }
          },
        ),

      ),
    );
  }
}
