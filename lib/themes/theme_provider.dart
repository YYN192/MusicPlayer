import 'package:flutter/material.dart';
import 'package:music_player/themes/light_mode.dart';
import 'dark_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Initially, light mode
  ThemeData _themeData = lightMode;

  // Get theme
  ThemeData get themeData => _themeData;

  // Is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // Set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners(); // This will update the UI
  }

  // Toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
