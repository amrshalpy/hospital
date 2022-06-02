import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static setData({required String key, required String value}) {
    return sharedPreferences.setString(key, value);
  }
}
