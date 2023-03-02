import 'package:banking_app/bloc/cubits/cards_cubit/cards_cubit.dart';
import 'package:banking_app/bloc/cubits/payment_cubit/payment_cubit.dart';
import 'package:banking_app/data/models/card_model.dart';
import 'package:banking_app/service/get_it/get_it.dart';
import 'package:banking_app/service/local_db/local_db_sevice.dart';
import 'package:banking_app/ui/card/widgets/custom_text_field.dart';
import 'package:banking_app/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
   PaymentPage({Key? key}) : super(key: key);

  TextEditingController sumController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  CardModel? currentCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Payment Page"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextField(controller: sumController, title: "Enter amount of money"),
            const SizedBox(height: 20,),
            CustomTextField(controller: cardController, title: "Enter Card number"),
            BlocBuilder<PaymentCubit,PaymentState>(
              builder: (context, state) {
              if(state is IdolFoundState){
                currentCard=state.cardModel;
                return CardWidget(card:state.cardModel);
              }else{
                return Container();
              }
              },
            ),
            const SizedBox(height: 20,),
            TextButton(onPressed: () {
              if(currentCard==null){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Card not selected")));
              }else if(int.parse(sumController.text)>currentCard!.amount){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You don't have enough money")));
              }else{
                context.read<PaymentCubit>().pay(cardController.text, int.parse(sumController.text));
                int amount = currentCard!.amount.toInt() - int.parse(sumController.text);
                getIt<LocalDatabase>().updateSum(currentCard!.cardNumber, 0,amount);
              }


            }, child: Text("Pay Now"))
          ],
        ),
      ),
    );
  }
}
