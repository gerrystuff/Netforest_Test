

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();
  factory AppPreferences() => _instance;

  AppPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }



  String get log {
    return _prefs.getString('log') ?? '';
  }

  set log(String log) {
    _prefs.setString('log', log);
  }




  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String token) {
    _prefs.setString('token', token);
  }


  
}