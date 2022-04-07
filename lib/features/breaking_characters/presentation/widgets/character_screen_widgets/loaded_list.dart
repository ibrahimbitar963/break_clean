import 'package:sizer/sizer.dart'
;import 'package:flutter/material.dart';

class LoadedListWidget extends StatelessWidget {
 final Widget list;
  const LoadedListWidget({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 100.w,


        child: Column(

          children: [
           list,
          ],
        ),
      ),
    );
  }
}
