import 'package:break_clean/core/const/colors.dart';
import 'package:flutter/material.dart';

class ThemeChecker extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDark => themeMode == ThemeMode.dark;
  void changeTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Themes {
  static final myDark = ThemeData(
    accentColor: Colors.white54,
    colorScheme: ColorScheme.dark(),
    scaffoldBackgroundColor: MyColors.myGrey,
    appBarTheme: AppBarTheme(
        backgroundColor: MyColors.myYellow, foregroundColor: Colors.black),
    dividerColor: MyColors.myYellow,
  );

  static final myLight = ThemeData(
    accentColor: Colors.green.shade200,
    colorScheme: ColorScheme.light(),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.tealAccent.shade400,
        foregroundColor: Colors.black),
    dividerColor: Colors.green.shade200,
  );
}
