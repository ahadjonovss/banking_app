import 'package:banking_app/bloc/blocs/add_card_bloc/add_card_bloc.dart';
import 'package:banking_app/bloc/cubits/cards_cubit/cards_cubit.dart';
import 'package:banking_app/ui/card/widgets/custom_text_field.dart';
import 'package:banking_app/ui/card/add_card/widgets/editable_card.dart';
import 'package:banking_app/ui/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:month_year_picker/month_year_picker.dart';

class AddCardPage extends StatefulWidget {
  AddCardPage({Key? key}) : super(key: key);

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController cardController = TextEditingController();

  Color? _mainColor = Colors.blue;

  final Color? _shadeColor = Colors.blue[800];

  @override
  Widget build(BuildContext context) {
    Color titleColor = Colors.white;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Add a new Card'),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AddCardBloc,AddCardState>(
          listener: (context, state) {
            if(state.status==CardStatus.DONE){
              context.read<CardsCubit>().getAllCards();
              Navigator.pop(context);
            }else if(state.status==CardStatus.FAILURY){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fill all gaps")));
            }
          },
          builder: (context, state) => Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.03),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditableCardWidget(),
                const SizedBox(height: 20,),
                CustomTextField(controller: nameController, title: "Owner Name"),
                const SizedBox(height: 20,),
                CustomTextField(controller: cardController, title: "Card number"),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () async {
                      DateTime? selected = await showMonthYearPicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2028),
                      );

                      // ignore: use_build_context_synchronously
                      context.read<AddCardBloc>().add(UpdateFieldsEvent(expireDate: "${selected!.month}/${selected.year.toString().substring(2,4)}"));


                    }, child: const Text("Exparition Date")),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      height: 40,
                      color: Colors.grey,
                      child: Text(state.expireDate.isEmpty?'Unselected':"Selected",style: TextStyle(color: titleColor),),
                    ),

                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () async {
                      _openColorPicker(context,state);
                    }, child: const Text("Card color")),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      height: 40,
                      color: Colors.grey,
                      child: Text(state.gradient.isEmpty?'Unselected':"Selected",style: TextStyle(color: titleColor),),
                    ),

                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () async {
                      _openColorPicker(context,state);
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
                    GlobalButton(color: Colors.lightBlueAccent, title: "Save Card", onTap: (){
                      context.read<AddCardBloc>().add(AddCardToDbEvent());
                    }),
                  ],
                )


              ],
            ),
          ),

        ),
      ),
    );
  }

  void _openDialog(String title, Widget content,BuildContext context,AddCardState state) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              child: const Text('SUBMIT'),
              onPressed: () {
                List<Color> colors = state.gradient;
                colors.add(_mainColor!);
                context.read<AddCardBloc>().add(UpdateFieldsEvent(gradient:colors));
                setState(() {});
                print(state.gradient);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _openColorPicker(BuildContext context,AddCardState state) async {
    _openDialog(
      "Color picker",
      MaterialColorPicker(
        selectedColor: _shadeColor,
        onColorChange: (color) {
          _mainColor = color;
        },
        onMainColorChange: (color) {},
        onBack: () {},),
      context,
      state
    );
  }
}
