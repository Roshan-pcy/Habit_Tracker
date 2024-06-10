import 'package:flutter/material.dart';
import 'package:habit_trakcer/pages/light_mode.dart';
import 'package:habit_trakcer/pages/night_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightmode;
  ThemeData get getTheme => _themeData;

  set setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  togalTheme(ThemeData themeData) {
    if (_themeData == themeData) {
      setTheme = darkMode;
    } else {
      setTheme = lightmode;
    }
  }
}
