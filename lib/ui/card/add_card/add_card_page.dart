import 'package:banking_app/ui/card/widgets/custom_text_field.dart';
import 'package:banking_app/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class AddCardPage extends StatelessWidget {
  AddCardPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController cardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color titleColor = Colors.white;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Add a new Card'),
      ),
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.03),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(),
            SizedBox(height: 20,),
            CustomTextField(controller: nameController, title: "Owner Name"),
            SizedBox(height: 20,),
            CustomTextField(controller: cardController, title: "Card number"),


          ],
        ),
      ),
    );
  }
}
