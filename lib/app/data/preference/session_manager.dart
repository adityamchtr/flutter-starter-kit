import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const _language = "language";
  static const _theme = "theme";
  static const _accessToken = "access_token";
  static const _fcmToken = "fcm_token";

  //Language
  static Future<bool> setLanguage(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_language, value);
  }

  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_language);
  }

  //Theme
  static Future<bool> setTheme(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_theme, value);
  }

  static Future<String?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_theme);
  }

  //Access Token API
  static Future<bool> setAccessToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_accessToken, value);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessToken);
  }

  static Future<bool> removeAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_accessToken);
  }

  //Access Token FCM
  static Future<bool> setFcmToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_fcmToken, value);
  }

  static Future<String?> getFcmToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fcmToken);
  }

  static Future<bool> removeFcmToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_fcmToken);
  }
}