import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class App_Provider extends ChangeNotifier {
  bool isDone = false;

  void isDoneTask() {
    isDone = true;
    notifyListeners();
  }

  ThemeMode themeMode = ThemeMode.light;

  void chanchAppTheme(ThemeMode theme) async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
    themeMode = theme;
    prefs.setString("theme", themeMode == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  bool isChach = false;

  void changeAppChach(bool chech) {
    isChach = chech;
    notifyListeners();
  }




//  void saveprefs(bool mode) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool("mode", mode);
//   }

//   var savedMode;
//   getprefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     savedMode = prefs.getBool("mode") ?? false;
//     notifyListeners();
//   }
}
