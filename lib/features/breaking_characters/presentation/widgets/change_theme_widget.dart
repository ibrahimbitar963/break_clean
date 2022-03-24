

import 'package:break_clean/core/const/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final  themeChecker=Provider.of<ThemeChecker>(context);


    return Switch.adaptive(
        value: themeChecker.isDark, onChanged: (value){
      final provider = Provider.of<ThemeChecker>(context, listen: false);
      provider.changeTheme(value);
    });
  }
}

