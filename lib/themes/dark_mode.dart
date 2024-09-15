import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Colors.blueGrey.shade900, // Primary color for the AppBar and buttons
        secondary: Colors.grey.shade700, // Toggle container color (lighter shade of grey)
        surface: Colors.grey.shade800, // Grey background instead of black
        inversePrimary: Colors.grey.shade500, // Lighter text or icon color for contrast
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900, // Grey AppBar instead of black
        foregroundColor: Colors.white, // White text on AppBar
    ),
    scaffoldBackgroundColor: Colors.grey.shade900, // Lighter grey scaffold background
);
