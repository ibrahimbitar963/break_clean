import 'package:break_clean/core/const/colors.dart';
import 'package:flutter/material.dart';

class  SearchFiled extends StatelessWidget {
  final TextEditingController controller ;
  final ValueChanged<String> addsearch;
  const  SearchFiled({Key? key, required this.controller,required this.addsearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: controller,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 18, color: MyColors.myGrey),
        hintText: 'Find a character',
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: 18, color: MyColors.myGrey),
      onChanged: addsearch,
    );
  }
}
