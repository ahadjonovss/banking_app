import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static StorageRepository? _storageUtil;
  static SharedPreferences? _preferences;


  static Future<StorageRepository> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageRepository._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  StorageRepository._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setIdol({
    required String cardNumber,

  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("idol", cardNumber);
  }

  Future<String> getIdol() async {
    final prefs = await  SharedPreferences.getInstance();
    return  prefs.getString("idol")??"";

  }


}