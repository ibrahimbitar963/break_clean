import 'package:break_clean/core/const/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_mode_handler/theme_mode_manager_interface.dart';

class ThemeManager implements IThemeModeManager{
  @override
  Future<String?> loadThemeMode() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(THEME_PREF);
  }

  @override
  Future<bool> saveThemeMode(String value) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(THEME_PREF, value);
  }
}