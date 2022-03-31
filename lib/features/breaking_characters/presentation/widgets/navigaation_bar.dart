import 'package:break_clean/core/const/themes.dart';
import 'package:break_clean/features/breaking_characters/presentation/widgets/character_screen_widgets/change_theme_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isOn = true;

  bool lan = true;
  final ThemeChecker themeChecker = ThemeChecker();

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
            label: 'Change theme'.tr().toString(), icon: ChangeThemeWidget()),
      ],
    );
  }
}
