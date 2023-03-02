import 'package:banking_app/bloc/blocs/add_card_bloc/add_card_bloc.dart';
import 'package:banking_app/utils/assistants/card_masker.dart';
import 'package:banking_app/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    Color titleColor = Colors.grey;
    return BlocConsumer<AddCardBloc,AddCardState>(
      listener: (context, state) {
        if(state.gradient.length>1){
          print(state.gradient);
          setState(() {});
        }
      },
     builder: (context, state) => Container(
       padding: const EdgeInsets.all(16),
       height: 224,
       width: 400,
       decoration: BoxDecoration(
         gradient: state.gradient.length>1?LinearGradient(
           colors: state.gradient
         ):null,
           borderRadius: BorderRadius.circular(12),
           color: Colors.white
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Discover Credit Card",style: TextStyle(color: textColor),),
           SizedBox(height: 4,),
           Divider(),
           Image.asset(AppImages.chip,width: 40,),
           Text("Card number",style: TextStyle(color: titleColor),),
           SizedBox(height: 8,),
           Text(cardMask(state.cardNumber),style: GoogleFonts.getFont("Cardo",fontSize: 24),),
           SizedBox(height: 8,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Owner Name",style: TextStyle(fontSize: 8,color: titleColor),),
                   Text(state.owner,style: TextStyle(fontSize: 12),),
                 ],
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Expire Date",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: titleColor),),
                   Text(state.expireDate??"",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
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
