import 'package:flutter/material.dart';

class RichWidget extends StatelessWidget {
  late   String title;
  late   String value;
   RichWidget({
    required this.value,
    required this.title

  }) : super();

  @override
  Widget build(BuildContext context) {
    return RichText(

      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
           style: Theme.of(context).textTheme.headline6,

          ),
          TextSpan(
            text: value,
             style: DefaultTextStyle.of(context).style,
          ),
        ],
      ),
    );
  }
}