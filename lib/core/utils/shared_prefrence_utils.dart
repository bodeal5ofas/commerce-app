import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefrenceUtils {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> set({required String key, required dynamic value}) async {
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else {
      return await sharedPreferences.setBool(key, value);
    }
  }

  static Object? get({required String key}) {
    return sharedPreferences.get(key);
  }

  static delete({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
