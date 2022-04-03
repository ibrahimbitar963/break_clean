import 'package:break_clean/core/prefrences/app_prefs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_mode_handler/theme_mode_manager_interface.dart';
import 'app_router.dart';
import 'core/app/app.dart';
import 'core/const/strings.dart';
import 'injection_container.dart' as di;

void main() async {
  late IThemeModeManager themeModeManager;
  themeModeManager = ThemeManager();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await di.init();
  runApp(
    EasyLocalization(
        saveLocale: true,
        child: MyApp(
          appRouter: AppRouter(),
          themeModeManager: themeModeManager,
        ),
        supportedLocales: supportedLocales,
        path: PATH_TO_LOCALE),
  );
}
