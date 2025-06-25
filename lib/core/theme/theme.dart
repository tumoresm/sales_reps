import 'package:flutter/material.dart';
import 'package:sales_reps/core/theme/app_colours.dart';

class AppTheme {
  
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colours.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(Colours.borderColor),

      focusedBorder: _border(Colours.gradient2),


    ),
  );
}