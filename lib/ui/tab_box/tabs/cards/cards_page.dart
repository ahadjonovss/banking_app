import 'package:banking_app/bloc/cubits/cards_cubit/cards_cubit.dart';
import 'package:banking_app/bloc/cubits/payment_cubit/payment_cubit.dart';
import 'package:banking_app/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  void initState() {
    context.read<CardsCubit>().getAllCards();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Cars Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(24),
          child: BlocBuilder<CardsCubit,CardsState>(
            builder: (context, state) {
              if(state is GettingCardInSuccessState){
                context.read<PaymentCubit>().getIdolCard(state.cards);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.cards.length,
                        itemBuilder: (context, index) => CardWidget(card: state.cards[index]),)
                    ],
                  ),
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
      ),
    );
  }
}
