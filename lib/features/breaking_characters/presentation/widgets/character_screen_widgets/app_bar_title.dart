import 'package:break_clean/features/breaking_characters/presentation/widgets/character_screen_widgets/translator.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
     translator(context,'APP_BAR_TITLE'),

    );
  }
}