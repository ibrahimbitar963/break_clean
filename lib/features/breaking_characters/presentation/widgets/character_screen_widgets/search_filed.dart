import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class  SearchFiled extends StatelessWidget {
  final TextEditingController controller ;
  final ValueChanged<String> addSearch;
  const  SearchFiled({Key? key, required this.controller,required this.addSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 18, ),
        hintText:'Find a character'.tr().toString()
        ,
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: 18, ),
      onChanged: addSearch,
    );
  }
}
