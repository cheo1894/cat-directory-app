import 'package:flutter/material.dart';

class DefaultTheme {
  final ThemeData _defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  );

  ThemeData get theme => _defaultTheme;
}
