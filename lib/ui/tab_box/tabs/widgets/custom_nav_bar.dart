

import 'package:banking_app/utils/file_importer/file_importer.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit,int>(
      builder: (context, state) =>
          BottomNavigationBar(
            backgroundColor: Colors.black,
            onTap: (index){
              context.read<BottomNavCubit>().changePageIndex(index);
            },
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.white,
              items:const [
                BottomNavigationBarItem(icon: Icon(Icons.list),label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.payment),label: "")
              ] )
    );
  }
}
