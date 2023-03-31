import 'package:banking_app/utils/file_importer/file_importer.dart';
// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  CardModel card;
  CardWidget({required this.card,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    Color titleColor = Colors.grey;
    return ZoomTapAnimation(
      onLongTap: () async {
        await context.read<PaymentCubit>().saveIdolCard(card.cardNumber);
        // ignore: use_build_context_synchronously
        getIt<CardsBloc>().add(GetAllCardsEvent());

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("It has been idol!")));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16),
        height: 233,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: card.image.isNotEmpty?DecorationImage(
            image: AssetImage(card.image),
            fit: BoxFit.cover
          ):null,
            gradient: card.gradient.length>1?LinearGradient(
                colors: card.gradient
            ):null,
            borderRadius: BorderRadius.circular(12),
            color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${card.amount} UZS",style: TextStyle(color: textColor),),
                ZoomTapAnimation(
                  onTap: () {
                    showDialog(context: context, builder: (context) => AlertDialog(
                      content: const Text("Rostdan ham kartani o'chirmoqchimisiz?"),
                      actions: [
                        TextButton(onPressed: () {
                          getIt<CardsBloc>().add(DeleteCardByIdEvent(card.cardNumber));

                          Navigator.pop(context);

                        }, child: const Text("Ha")),
                        TextButton(onPressed: () {
                          Navigator.pop(context);

                        }, child: Text("Yo'q")),
                      ],
                    ),);
                  },
                    child: Icon(Icons.delete,color: Colors.white,))
              ],
            ),
            const SizedBox(height: 4,),
            const Divider(),
            Image.asset(AppImages.chip,width: 40,),
            Text("Card number",style: TextStyle(color: titleColor),),
            const SizedBox(height: 8,),
            Text(cardMask(card.cardNumber),style: GoogleFonts.getFont("Cardo",fontSize: 24),),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Owner Name",style: TextStyle(fontSize: 8,color: titleColor),),
                    Text(card.author,style: const TextStyle(fontSize: 12),),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Expire Date",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: titleColor),),
                    Text(card.expireDate??"",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                  ],
                ),
                Image.asset(AppImages.visa,width: 80,)
              ],
            )
          ],
        ),
      ),
    );
  }



}

