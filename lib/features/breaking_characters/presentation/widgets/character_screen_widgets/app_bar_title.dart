import 'package:break_clean/core/local/app_local.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    return Text(
     translator.translate('APP_BAR_TITLE')!,

    );
  }
}