import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white);

  static ThemeData get dark => ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black);
}
