import 'package:break_clean/core/const/colors.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }
}