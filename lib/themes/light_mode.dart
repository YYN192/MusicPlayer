import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: Colors.grey.shade300, // Lighter blue-grey for the AppBar and buttons
        secondary: Colors.grey.shade400, // Lighter toggle container color
        surface: Colors.grey.shade300, // Light grey background instead of white
        inversePrimary: Colors.black, // Text or icon color for contrasts
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade200, // Light grey AppBar instead of white
        foregroundColor: Colors.black, // Black text on AppBar
    ),
    scaffoldBackgroundColor: Colors.grey.shade100, // Light grey scaffold background
);
