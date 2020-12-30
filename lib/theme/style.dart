import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData darkTheme() {
    return ThemeData.dark();
  }

  static ThemeData lightTheme() {
    return ThemeData.light();
  }

  static ThemeData appTheme() {
    return ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.orange,
      hintColor: Colors.white,
      dividerColor: Colors.white,
      buttonColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      canvasColor: Colors.black,
    );
  }
}
