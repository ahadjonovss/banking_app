

import 'package:banking_app/utils/file_importer/file_importer.dart';

class EditableCardWidget extends StatefulWidget {
  const EditableCardWidget({Key? key}) : super(key: key);

  @override
  State<EditableCardWidget> createState() => _EditableCardWidgetState();
}

class _EditableCardWidgetState extends State<EditableCardWidget> {
  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    Color titleColor = Colors.grey;
    return BlocConsumer<AddCardBloc,AddCardState>(
      listener: (context, state) {
        if(state.gradient.length>1){
          setState(() {});
        }
      },
     builder: (context, state) => Container(
       padding: const EdgeInsets.all(16),
       height: 224,
       width: 400,
       decoration: BoxDecoration(
           image: state.image.isNotEmpty?DecorationImage(
               image: AssetImage(state.image),
               fit: BoxFit.cover
           ):null,
         gradient: state.gradient.length>1?LinearGradient(
           colors: state.gradient
         ):null,
           borderRadius: BorderRadius.circular(12),
           color: state.gradient.length==1?state.gradient[0]:Colors.white
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Discover Credit Card",style: TextStyle(color: textColor),),
           const SizedBox(height: 4),
           const Divider(),
           Image.asset(AppImages.chip,width: 40,),
           Text("Card number",style: TextStyle(color: titleColor),),
           const SizedBox(height: 8),
           Text(cardMask(state.cardNumber),style: GoogleFonts.getFont("Cardo",fontSize: 24),),
           const SizedBox(height: 8),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Owner Name",style: TextStyle(fontSize: 8,color: titleColor),),
                   Text(state.owner,style: const TextStyle(fontSize: 12),),
                 ],
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Expire Date",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: titleColor),),
                   Text(state.expireDate,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
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
