import 'package:break_clean/core/const/colors.dart';
import 'package:flutter/material.dart';

class LoadedListWidget extends StatelessWidget {
 final Widget list;
  const LoadedListWidget({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

        child: Column(
          children: [
           list,
          ],
        ),
      ),
    );
  }
}
