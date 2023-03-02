import 'package:banking_app/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    Color titleColor = Colors.grey;
    return Container(
      padding: EdgeInsets.all(16),
      height: 224,
      width: 400,
      decoration: BoxDecoration(
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
          Text("1111 2222 3333 4444",style: GoogleFonts.getFont("Cardo",fontSize: 24),),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Owner Name",style: TextStyle(fontSize: 8,color: titleColor),),
                  Text("Samandar Ahadjonov",style: TextStyle(fontSize: 12),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expire Date",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: titleColor),),
                  Text("11/23",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                ],
              ),
              Image.asset(AppImages.visa,width: 80,)
            ],
          )
        ],
      ),
    );
  }
}
