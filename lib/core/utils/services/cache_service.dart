import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class CacheService {
  late SharedPreferences _sharedPreferences;

  CacheService() {
    init();
  }

  void init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);
    return await _sharedPreferences.setInt(key, value);
  }

  // static Future<bool?> deleteAllData() async {
  //   return await sharedPreferences!.clear();
  // }

  Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }
}
