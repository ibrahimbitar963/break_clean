import 'package:break_clean/core/const/colors.dart';
import 'package:flutter/material.dart';

class ThemeChecker extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDark => themeMode== ThemeMode.dark;

  void changeTheme(bool isOn){
    themeMode = isOn?ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}
class Themes{
static final myDark = ThemeData(
  scaffoldBackgroundColor: MyColors.myGrey ,
  appBarTheme: AppBarTheme(
    backgroundColor: MyColors.myYellow,
    foregroundColor: Colors.black
  ),
  //    colorScheme: ColorScheme.dark(),
  accentColor:  Colors.white54,



);
static final myLight = ThemeData(
    scaffoldBackgroundColor: Colors.white ,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.tealAccent.shade400,
      foregroundColor: Colors.black
    ),
  accentColor: Colors.green.shade200,
  //  colorScheme: ColorScheme.light(),


);






}