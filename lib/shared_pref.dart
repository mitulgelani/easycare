import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String auth_token = "auth_token";

//set data into shared preferences like this
  Future<void> setAuthToken(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

//get value from shared preferences
  Future<String> getAuthToken(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String auth_token;
    auth_token = (pref.getString(key) ?? null)!;
    return auth_token;
  }
}
