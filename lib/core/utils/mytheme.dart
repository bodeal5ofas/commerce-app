import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Mytheme {
  static Color mainColor = Color(0xff004182);
  static Color whiteColor = Colors.white;
  static Color textColor = Color(0xff004182);
  ThemeData mainTheme = ThemeData(
      primaryColor: mainColor,
      scaffoldBackgroundColor: mainColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
      ));
}
