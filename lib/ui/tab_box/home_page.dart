import 'package:banking_app/utils/file_importer/file_importer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getIt<NotificationService>().handleFirebaseNotificationMessages();
    getIt<NotificationService>().setupInteractedMessage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit,int>(
      builder: (context, state) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ZoomTapAnimation(
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, addCard);

            },
          ),
        ),
        body: IndexedStack(
          index: context.read<BottomNavCubit>().activePageIndex,
          children: context.read<BottomNavCubit>().pages,
        ),
        bottomNavigationBar: const CustomNavigationBar() ,
      ),
    );
  }
}
