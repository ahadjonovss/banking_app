import 'package:banking_app/utils/file_importer/file_importer.dart';

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
                ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Card not selected")));
              }else if(int.parse(sumController.text)>currentCard!.amount){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You don't have enough money")));
              }else{
                context.read<PaymentCubit>().pay(cardController.text, int.parse(sumController.text));
                int amount = currentCard!.amount.toInt() - int.parse(sumController.text);
                getIt<LocalDatabase>().updateSum(currentCard!.cardNumber, 0,amount);
              }


            }, child:const  Text("Pay Now"))
          ],
        ),
      ),
    );
  }
}
