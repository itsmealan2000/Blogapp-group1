import 'package:blogapp/theme/mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData =lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode =>themeData == darkMode;

  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == lightMode) {
      themeData=darkMode;
    }else{
      themeData=lightMode;
    }
  }
  
}