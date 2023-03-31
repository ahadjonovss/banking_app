import 'package:banking_app/utils/file_importer/file_importer.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance.getToken().then((value) async {
      var shared = await SharedPreferences.getInstance();
      await shared.setString("token", value!);
      debugPrint("Token: $value");
    });
    Future.delayed( const Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(context, home, (route) => false));
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Image.asset(AppImages.logo,width: 200,),
              const Text("Banking App",style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}

