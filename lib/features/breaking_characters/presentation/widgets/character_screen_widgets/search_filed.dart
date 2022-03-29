import 'package:break_clean/features/breaking_characters/presentation/widgets/character_screen_widgets/translator.dart';
import 'package:flutter/material.dart';

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
        hintText: translator(context,'Find a character'),
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: 18, ),
      onChanged: addSearch,
    );
  }
}
