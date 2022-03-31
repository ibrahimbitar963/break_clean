import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
     'Characters'.tr().toString()

    );
  }
}