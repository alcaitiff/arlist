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
      hintColor: Colors.white,
      dividerColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      canvasColor: Colors.black, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
    );
  }
}
