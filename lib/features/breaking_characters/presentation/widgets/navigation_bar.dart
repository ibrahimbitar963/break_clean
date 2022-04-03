import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool lan = true;
  bool theme = true;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'Change language'.tr().toString(),
          icon: IconButton(
            onPressed: () {
              if (lan == true) {
                context.setLocale(Locale('ar', 'EG'));

                lan = false;
              } else {
                context.setLocale(Locale('en', 'US'));
                lan = true;
              }
            },
            icon: Icon(Icons.translate),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Change theme'.tr().toString(),
          icon: IconButton(
            onPressed: () {
              if (theme == true) {
                ThemeModeHandler.of(context)!.saveThemeMode(ThemeMode.dark); //D

                theme = false;
              } else {
                ThemeModeHandler.of(context)!.saveThemeMode(ThemeMode.light); //
                theme = true;
              }
            },
            icon: Icon(Icons.brightness_6_outlined),
          ),
        ),
      ],
    );
  }
}
