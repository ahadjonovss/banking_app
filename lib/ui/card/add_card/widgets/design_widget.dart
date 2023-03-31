
import 'package:banking_app/utils/file_importer/file_importer.dart';

class DesignWidget extends StatelessWidget {
  const DesignWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => ZoomTapAnimation(
          onTap: () {
            context.read<AddCardBloc>().add(UpdateFieldsEvent(image:"assets/$index.png" ));
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(top: 12),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/$index.png"),
                    fit: BoxFit.cover
                )
            ),
          ),
        ),),
    );
  }
}
