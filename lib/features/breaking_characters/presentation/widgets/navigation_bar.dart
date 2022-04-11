import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool lan = true;
  bool theme = true;
  late int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      items: [
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
            icon: Platform.isAndroid ? Icon(Icons.brightness_6_outlined):
                   Icon(CupertinoIcons.brightness) ,
    ),
          ),

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
            icon: Platform.isAndroid ? Icon(Icons.translate):
    Icon(CupertinoIcons.globe) ,
            ),
          ),


      ],
      selectedLabelStyle: TextStyle(fontSize: 12.sp),
      unselectedLabelStyle:TextStyle(fontSize: 9.sp) ,
      selectedItemColor:Theme.of(context).canvasColor,


    );
  }
}
