import 'package:break_clean/core/const/colors.dart';
import 'package:break_clean/core/local/app_local.dart';
import 'package:flutter/material.dart';

class  SearchFiled extends StatelessWidget {
  final TextEditingController controller ;
  final ValueChanged<String> addSearch;
  const  SearchFiled({Key? key, required this.controller,required this.addSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    return TextField(

      autofocus: true,
      controller: controller,
      cursorColor: MyColors.myGrey,

      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 18, ),
        hintText: translator.translate('Find a character'),
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: 18, ),
      onChanged: addSearch,
    );
  }
}
