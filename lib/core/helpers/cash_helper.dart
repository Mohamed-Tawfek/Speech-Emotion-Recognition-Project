import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;
  static Future<SharedPreferences> init() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  static getData({required String key}) => sharedPreferences!.get(key);

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is bool) {

      return await sharedPreferences!.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is double) {
      return await sharedPreferences!.setDouble(key, value);
    }

    return await sharedPreferences!.setString(key, value);
  }

  static Future<bool> remove({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
}
