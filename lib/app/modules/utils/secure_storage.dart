
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageService {
  late SharedPreferences preferences;

  Future<String?> getValue({required String key}) async {
    preferences = await SharedPreferences.getInstance();
    String? value = preferences.getString(key);
    return value;
  }

  Future<void> setValue({
    required String key,
    required String value,
  }) async {
    preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  delete({bool shouldDeleteAll = false, String? key}) async {
    preferences = await SharedPreferences.getInstance();
    if (shouldDeleteAll) {
      preferences.clear();
    } else {
      if (key != null) {
        preferences.remove(key);
      }
    }
  }
}