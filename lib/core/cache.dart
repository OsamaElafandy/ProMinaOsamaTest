import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString('token', token);
    } catch (e) {
      print(e.toString());
    }
  }

  static getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getString('token');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static saveName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString('Name', name);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<String> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getString('Name') as String;
    } catch (e) {
      print(e.toString());
      return '';
    }
  }
}
