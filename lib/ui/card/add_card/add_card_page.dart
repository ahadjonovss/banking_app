import 'package:banking_app/bloc/blocs/add_card_bloc/add_card_bloc.dart';
import 'package:banking_app/ui/card/widgets/custom_text_field.dart';
import 'package:banking_app/ui/widgets/card_widget.dart';
import 'package:banking_app/ui/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:month_year_picker/month_year_picker.dart';

class AddCardPage extends StatelessWidget {
  AddCardPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController cardController = TextEditingController();

  ColorSwatch? _tempMainColor;
  Color? _tempShadeColor;
  ColorSwatch? _mainColor = Colors.blue;
  Color? _shadeColor = Colors.blue[800];



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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.03),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CardWidget(),
              const SizedBox(height: 20,),
              CustomTextField(controller: nameController, title: "Owner Name"),
              const SizedBox(height: 20,),
              CustomTextField(controller: cardController, title: "Card number"),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () async {
                    final selected = await showMonthYearPicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2028),
                    );
                    if(selected!=null){
                      // ignore: use_build_context_synchronously
                      context.read<AddCardBloc>().add(UpdateFieldsEvent(expireDate: "${selected.month}/${selected.year.toString().substring(1,3)}"));

                    }

                  }, child: Text("Exparition Date")),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    height: 40,
                    color: Colors.grey,
                    child: Text('Unselected',style: TextStyle(color: titleColor),),
                  ),

                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () async {
                   _openColorPicker(context);
                  }, child: Text("Card color")),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    height: 40,
                    color: Colors.grey,
                    child: Text('Unselected',style: TextStyle(color: titleColor),),
                  ),

                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () async {
                    _openColorPicker(context);
                  }, child: const Text("Card Image")),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    height: 40,
                    color: Colors.grey,
                    child: Text('Unselected',style: TextStyle(color: titleColor),),
                  ),

                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalButton(color: Colors.red, title: "Cancel action", onTap: (){}),
                  GlobalButton(color: Colors.lightBlueAccent, title: "Save Card", onTap: (){}),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
  void _openDialog(String title, Widget content,BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: Text('SUBMIT'),
              onPressed: () {
              },
            ),
          ],
        );
      },
    );
  }

  void _openColorPicker(BuildContext context) async {
    _openDialog(
      "Color picker",
      MaterialColorPicker(
        selectedColor: _shadeColor,
        onColorChange: (color) {},
        onMainColorChange: (color) {},
        onBack: () {},
      ),
      context
    );
  }



}
