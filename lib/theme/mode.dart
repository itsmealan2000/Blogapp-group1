import 'package:flutter/material.dart';

//light mode
ThemeData lightMode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade300,
    surface: Colors.grey.shade100,
    secondary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade900
  ),
);

//dark mode
ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade200
  ),
);